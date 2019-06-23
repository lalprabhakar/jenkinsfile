pipeline{
    agent any
    stages{
        stage('Clone of Git'){
            steps {
                   sh 'git clone git@github.com:opstree/spring3hibernate.git'
                   sh 'cd spring3hibernate'
                   sh 'mvn install'
            }

         }
        
    

    }
}

