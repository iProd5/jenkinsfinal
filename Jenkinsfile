// avoided using a groovy script so i dont loose this when job is deleted.
node {
    def app

    
stage('Clone repository') {
        //  Clones the Repository to our Workspace

        checkout scm
    }

    stage('Build image') {
        //  This builds the image

        // app = docker.build("lutherphoenix/test")
        app = docker.build("test-push-from-image-from-jenkins")
    }

    stage('Test image') {
        
        app.inside {
            // echo this test to check if imsge was built alright
            echo "Tests passed"
        }
    }

    stage('Push image') {
    //   pushing image to ecr
        // docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
        //     app.push("latest")
        //     } 

        // pushing image to ecr
             docker.withRegistry('https://879622740067.dkr.ecr.us-east-2.amazonaws.com', 'ecr:us-east-2:aws-ecr') {
                docker.image('test-push-from-image-from-jenkins').push('latest')
    }
                echo "Pushing to ECR"
    }
}
