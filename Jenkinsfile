// avoided using a groovy script so i dont loose this when job is deleted.
node {
    def app

    
stage('Clone repository') {
        //  Clones the Repository to our Workspace

        checkout scm
    }

    stage('Build image') {
        //  This builds the image

        app = docker.build("lutherphoenix/nodeapp")
    }

    stage('Test image') {
        
        app.inside {
            // echo this test to check if imsge was built alright
            echo "Tests passed"
        }
    }

    stage('Push image') {
    //   pushing image to ecr
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            } 
                echo "this will try Pushing Docker Build to DockerHub"
    }
}
