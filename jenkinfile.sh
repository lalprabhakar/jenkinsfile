pipeline{
    agent any
    stages{
        stage('Git Clone'){
            steps {
                sh 'rm -rf spring3hibernate; git clone git@github.com:opstree/spring3hibernate.git'
            }
         }
        
    
          stage('Code Stability'){
            steps {
                sh 'cd /var/lib/jenkins/workspace/pipeline_git/spring3hibernate; mvn compile'
                
            }
    }

  stage('Code Quality'){
            steps {
                sh 'cd /var/lib/jenkins/workspace/pipeline_git/spring3hibernate; mvn checkstyle:checkstyle'

            }
    }

 stage('Code Coverage'){
            steps {
                sh 'cd /var/lib/jenkins/workspace/pipeline_git/spring3hibernate; mvn cobertura:corbertura'

            }
    }

    }
}

