pipeline {
    agent any

    environment {
        TF_VAR_hyperv_host = "192.168.50.1"
    }

    stages {

        stage('Debug') {
            steps {
                sh 'echo "===== DEBUG INFO ====="'
                sh 'echo "Current directory:"'
                sh 'pwd'
                sh 'echo "Root folder content:"'
                sh 'ls -la'
                sh 'echo "Terraform folder content:"'
                dir('terraform') {
                    sh 'pwd'
                    sh 'ls -la'
                }
                sh 'echo "TF_VAR_hyperv_host value:"'
                sh 'echo $TF_VAR_hyperv_host'
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
    }
}
