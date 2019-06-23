pipeline{
    agent any
    stages{
        stage('Installation of Dependency'){
            steps {
                sh 'yum install maven -y'
                sh 'wget http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.14/bin/apache-tomcat-9.0.14.tar.gz'
                sh 'tar -xvf apache-tomcat-9.0.14.tar.gz'
                sh 'mv apache-tomcat-9.0.14 tomcat9'
            }
         }
        
    

    }
}

