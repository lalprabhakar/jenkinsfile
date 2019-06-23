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
        stage('Code Quality'){
            steps {
                   sh 'cd spring3hibernate; mvn checkstyle:checkstyle'
            }

         }
       stage('Code Coverage'){
            steps {
                sh 'cd spring3hibernate; mvn cobertura:cobertura'

            }
    }

  stage('Publish Report'){
            steps {
                  cobertura autoUpdateHealth: false, autoUpdateStability: false, coberturaReportFile: '**/target/site/cobertura/coverage.xml', conditionalCoverageTargets: '70, 0, 0', failUnhealthy: false, failUnstable: false, lineCoverageTargets: '80, 0, 0', maxNumberOfBuilds: 0, methodCoverageTargets: '80, 0, 0', onlyStable: false, sourceEncoding: 'ASCII', zoomCoverageChart: false
                  checkstyle canComputeNew: false, defaultEncoding: '', healthy: '', pattern: '**/checkstyle-result.xml', unHealthy: ''
                  findbugs canComputeNew: false, defaultEncoding: '', excludePattern: '', healthy: '', includePattern: '', pattern: '**/findbugsXml.xml', unHealthy: ''
 

            }
    }


    

    }
}
            

