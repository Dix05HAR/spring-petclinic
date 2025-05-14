pipeline {
  agent any

  tools {
    maven 'Maven 3.8.6'
    jdk 'Java 17'
  }

  environment {
    MAVEN_OPTS = '-Dmaven.test.failure.ignore=false'
  }

  stages {
    stage('Checkout') {
      steps {
        git(
          url: 'https://github.com/spring-projects/spring-petclinic.git',
          branch: 'main',
          changelog: true,
          poll: true
        )
      }
    }

    stage('Build') {
      steps {
        sh 'mvn clean install'
      }
    }

    stage('Test') {
      steps {
        sh 'mvn test'
      }
    }

    stage('Package') {
      steps {
        sh 'mvn package'
      }
    }

    stage('Archive') {
      steps {
        archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
      }
    
    stage('Deploy') {
            steps {
                sh '''
                pkill -f spring-petclinic.jar || true
                nohup java -jar target/spring-petclinic.jar > app.log 2>&1 &
                '''
    }
  }
}
