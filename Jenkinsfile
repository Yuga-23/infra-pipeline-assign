pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
  }

  stages {
    stage('Checkout') {
      steps {
        git url: 'https://github.com/Yuga23/new-infra-pipeline.git', branch: 'main'
      }
    }

    stage('Terraform in Docker') {
      steps {
        script {
          docker.image('hashicorp/terraform:1.6.0').inside {
            sh 'terraform init'
            sh 'terraform plan -out=tfplan'
            input message: 'Apply infrastructure changes?'
            sh 'terraform apply tfplan'
          }
        }
      }
    }
  }
}
