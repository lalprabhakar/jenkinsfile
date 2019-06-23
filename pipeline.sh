pipeline{
    agent any
    stages{
        stage('Clone of Git'){
            steps {
                   sh 'rm -rf spring3hibernate;git clone git@github.com:opstree/spring3hibernate.git'
            }

         }
         stage('Email Notification'){
            steps {
                  mail bcc: '', body: 'Hello Bulid started', cc: '', from: '', replyTo: '', subject: 'Prabhakar to start build', to: 'prabhakarlal20@gmail.com'
                   
            }

         }
         stage('Slack Notification'){
            steps {
                  slackSend channel: 'ot-ninja-batch5', color: 'Green', iconEmoji: '', message: 'Prabhakar to start build', tokenCredentialId: 'plal', username: ''
            }

         }

         stage('Input Process'){
            steps {
                input message: 'Only for admin User', submitter: 'proceed'
            }

         }
        stage('Code Stability'){
            steps {
                   sh 'cd spring3hibernate; mvn compile'
            }

         }

    

    }
}

