pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID     = credentials('aws-access-key-id')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/Yuga-23/infra-pipeline-assign.git', credentialsId: 'github-credentials'
      }
    }

    stage('Terraform in Docker') {
      steps {
        script {
          def tfImage = docker.image('hashicorp/terraform:1.6.0')
          tfImage.withRun("-v ${pwd()}:/workspace -w /workspace") { c ->
            sh "docker exec ${c.id} terraform init"
            sh "docker exec ${c.id} terraform plan -out=tfplan"
            sh "docker exec ${c.id} terraform apply -auto-approve tfplan"
          }
        }
      }
    }
  }
}
