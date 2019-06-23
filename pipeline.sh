pipeline{
    agent any
    stages{
        stage('Clone of Git'){
            steps {
                   sh 'rm -rf pipelinework;git clone git@github.com:opstree/spring3hibernate.git'
            }

         }
        
    

    }
}

