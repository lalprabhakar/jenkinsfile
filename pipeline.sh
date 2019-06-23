pipeline{
    agent any
    stages{
        stage('Clone of Git'){
            steps {
                   sh 'git clone git@github.com:opstree/spring3hibernate.git'
                   sh 'cd /var/lib/jenkins/workspace/pipelinework/spring3hibernate'
                   sh 'pwd'
                   sh 'mvn install'
            }

         }
        
    

    }
}

