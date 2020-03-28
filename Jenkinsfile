// 
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID     = credentials('ECRURL')
        // AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building'
            script{   
            docker.build("$IMAGE")
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
    //             script{   
    //             // pushing image to ecr
                docker.withRegistry('$AWS_ACCESS_KEY_ID', 'ecr:us-east-2:aws-ecr') {
                docker.image('$IMAGE').push('latest')
        }
    }
            
            }
        }
    }  
    post {
    
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
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
            junit 'test-reports/results.xml'
        }
    }  

} 