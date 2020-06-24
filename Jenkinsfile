pipeline {
    agent any 
    stages {       
    stage('Checkout'){
            steps {
                git(url: 'https://github.com/snehakokil/insecurebank.git', branch: 'master')
                stash name:'Source', includes:'**/**'
                stash name:'dockerfile', includes: '**/Dockerfile'
                
            }
        }       
     stage('Build') {
            agent { 
                docker { 
                    image 'maven:3.5.2-jdk-8'
                    args ' -v $HOME/.m2:/root/.m2'
                    
                } 
            }
            steps {
                unstash 'Source'
                sh 'mvn clean package' 
                stash name:'WarFile', includes: '**/*.war' 
            }            
        }
        
        stage('SAST') {
            agent { 
                docker { 
                    image 'maven:3.5.2-jdk-8'
                    args ' -v $HOME/.m2:/root/.m2'
                    
                } 
            }
            steps {
                unstash 'Source'
                sh 'mvn clean compile spotbugs:spotbugs' 
                
                archiveArtifacts '**/spotbugsXml.xml'
               
            }            
        }

 
        stage('OWASP Dependency Check') {
            steps{
                step([$class: 'MSTestPublisher', testResultsFile:"**/*.trx", failOnError: true, keepLongStdio: true])

            }
        }
}
}
