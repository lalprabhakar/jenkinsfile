pipeline{
    agent any
    stages{
        stage('Clone of Git'){
            steps {
                   sh 'git clone git@github.com:opstree/spring3hibernate.git'
                   sh 'cd spring3hibernate; mvn install'
            }

         }
         stage('Email Notification'){
            steps {
                  mail bcc: '', body: 'Hello Bulid started', cc: '', from: '', replyTo: '', subject: 'Going to start build', to: 'prabhakarlal20@gmail.com'
                   
            }

         }

    

    }
}

