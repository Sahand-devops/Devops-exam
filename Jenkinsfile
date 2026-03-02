pipeline {
    agent any

    environment {
      TF_VAR_hyperv_host = "192.168.50.1"
}


    stages {
        stage('Debug') {
    steps {
        sh 'echo $TF_VAR_hyperv_host'
        sh 'ls -la'
        dir('terraform') {
            sh 'ls -la'
        }
    }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
