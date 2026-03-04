pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps{
                checkout scm
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

        stage('Get VM IP') {
            steps {
                dir('terraform') {
                    script {
                        VM_IP = sh(
                            script: "terraform output -raw vm_ip",
                            returnStdout: true
                        ).trim()

                        echo "VM IP is: ${VM_IP}"
                    }
                }
            }
        }
    }
}
