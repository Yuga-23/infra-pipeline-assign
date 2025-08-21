pipeline {
  agent any

  environment {
    TF_IMAGE             = 'hashicorp/terraform:1.6.0'
    WORKSPACE_DIR        = '/mnt/c/ProgramData/Jenkins/.jenkins/workspace/infra-pipieline-assign'
    AWS_ACCESS_KEY_ID    = credentials('aws-access-key-id')
    AWS_SECRET_ACCESS_KEY= credentials('aws-secret-access-key')
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/Yuga-23/infra-pipeline-assign.git', credentialsId: 'github-credentials'
      }
    }

    stage('Terraform Init') {
      steps {
        sh """
          docker run --rm -it \
            --entrypoint="" \
            -v ${WORKSPACE_DIR}:/workspace \
            -w /workspace \
            -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
            -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
            ${TF_IMAGE} \
            terraform init
        """
      }
    }

    stage('Terraform Plan') {
      steps {
        sh """
          docker run --rm -it \
            --entrypoint="" \
            -v ${WORKSPACE_DIR}:/workspace \
            -w /workspace \
            -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
            -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
            ${TF_IMAGE} \
            terraform plan -out=tfplan
        """
      }
    }

    stage('Terraform Apply') {
      steps {
        sh """
          docker run --rm -it \
            --entrypoint="" \
            -v ${WORKSPACE_DIR}:/workspace \
            -w /workspace \
            -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
            -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
            ${TF_IMAGE} \
            terraform apply -auto-approve tfplan
        """
      }
    }
  }
}
