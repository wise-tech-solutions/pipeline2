pipeline {
    agent any

    environment {
        WAR_FILE = 'target/linkpay.war'        // WAR file path
        MAVEN_TOOL = 'maven3.9.11'             // Maven tool name
        SLACK_CHANNEL = '#new-build'           // Slack channel
    }

    stages {
        stage('1. Git Build') {
            steps {
                git branch: 'main', url: 'https://github.com/wise-tech-solutions/pipeline2.git'
            }
        }

        stage('2. Maven Build') {
            steps {
                withMaven(maven: "${MAVEN_TOOL}") {
                    sh "mvn clean package -Dmaven.test.skip=true"
                }
            }
        }

        stage('3. SonarQube Analysis') {
            steps {
                echo "⏩ Skipping SonarQube analysis for now..."
            }
        }

        stage('4. Deploy to Nexus') {
            steps {
                echo "⏩ Skipping Nexus deployment for now..."
            }
        }

        stage('5. Deploy to Test Tomcat') {
            steps {
                echo "🚀 Deploying WAR to TEST Tomcat server..."
                deploy adapters: [
                    tomcat9(
                        credentialsId: 'jenkins-cred',
                        url: 'http://localhost:8080/'
                    )
                ],
                contextPath: 'linkpay-test',
                war: "${WAR_FILE}"
            }
        }

        stage('6. Manual Approval Before Production') {
            steps {
                script {
                    slackSend(
                        channel: "${SLACK_CHANNEL}",
                        message: "🟡 *AWAITING APPROVAL:* ${env.JOB_NAME} #${env.BUILD_NUMBER} — Waiting for manual approval to deploy to *PRODUCTION*.",
                        color: '#e6c300'
                    )

                    timeout(time: 10, unit: 'MINUTES') {
                        input message: "✅ Approve deployment to PRODUCTION Tomcat?"
                    }

                    slackSend(
                        channel: "${SLACK_CHANNEL}",
                        message: "🟢 *APPROVED:* ${env.JOB_NAME} #${env.BUILD_NUMBER} — Proceeding with *PRODUCTION* deployment.",
                        color: 'good'
                    )
                }
            }
        }

        stage('7. Deploy to Production Tomcat') {
            steps {
                echo "🚀 Deploying WAR to PRODUCTION Tomcat server..."
                deploy adapters: [
                    tomcat9(
                        credentialsId: 'jenkins-cred',
                        url: 'http://tomcat-prod:8080/'
                    )
                ],
                contextPath: 'linkpay',
                war: "${WAR_FILE}"
            }
        }
    }

    post {
        success {
            slackSend(channel: "${SLACK_CHANNEL}", message: "✅ *SUCCESS:* ${env.JOB_NAME} #${env.BUILD_NUMBER} — Deployment completed successfully!", color: 'good')
        }
        failure {
            slackSend(channel: "${SLACK_CHANNEL}", message: "❌ *FAILED:* ${env.JOB_NAME} #${env.BUILD_NUMBER} — Check Jenkins logs for details.", color: 'danger')
        }
        unstable {
            slackSend(channel: "${SLACK_CHANNEL}", message: "⚠️ *UNSTABLE:* ${env.JOB_NAME} #${env.BUILD_NUMBER}", color: 'warning')
        }
    }
}
