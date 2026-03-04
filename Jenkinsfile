pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
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
                        env.VM_IP = sh(
                            script: "terraform output -raw vm_ip",
                            returnStdout: true
                        ).trim()
                    }
                }
            }
        }
        
        stage('Wait for SSH') {
            steps {
                sh """
                    echo "Waiting for SSH..."

                    until ssh -o StrictHostKeyChecking=no -o BatchMode=yes ubuntu@$VM_IP "echo ready"
                    do
                        echo "Waiting for SSH..."
                        sleep 5
                    done

                    echo "SSH is ready"
                """
            }
        }
    }
}