pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        script {
          sh 'dotnet build Lab1.sln'
        }
      }
    }
    stage('Docker Build') {
      steps {
        script {
          sh 'docker build -t lab1-api .'
        }
      }
    }
    stage('Deploy to Staging') {
      steps {
        script {
          sh 'docker-compose up --build -d'
        }
      }
    }
  }
}