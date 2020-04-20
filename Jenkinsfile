// 
pipeline {
    agent any
   
    stages {
        stage('Build first image') {
            steps {
                echo 'Building'
            script{   
            docker.build("hello")
                }
            }
        }
        stage('Build second image anotherhello') {
            steps {
                echo 'Building'
            script{   
                docker.build("anotherhello", "-f ${env.WORKSPACE}/second/src/Dockerfile .")
           // docker.build("anotherhello")
                }
            }
        }
        stage('Test') {
            steps {

                echo 'installing pytest'
        // sh  ''' python3 -m pip install pytest
        //     '''   

                echo 'Testing'
        // sh  ''' cd Test
        //         python3 -m pytest --verbose --junit-xml ../test-reports/results.xml
        //         '''
            }
        }
        stage('Deploy') {
            steps {
                echo 'push to ECR '
               // script{   
    //             // pushing image to ecr
               // docker.withRegistry('https://$ID', 'ecr:us-east-2:aws-ecr') {
               // docker.image('$image').push('latest')
       // }
 //   }
            
            }
        }
    }  
    post {
    
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
            echo 'this will be where the email will be sent'
            
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    always {
            echo 'This will always run'
            // junit 'test-reports/results.xml'
            sh 'docker rmi anotherhello | true'
            sh 'docker rmi hello | true' 
        }
    }  
}
