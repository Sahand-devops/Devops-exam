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

        stage('Fix SSH key permissions') {
            steps {
                dir('ansible') {
                    sh 'chmod 600 deploy_key'
                }
            }
        }
        
        stage('Wait for SSH') {
            steps {
                dir('ansible') {
                    timeout(time: 3, unit: 'MINUTES') {
                        sh """
                            echo "Waiting for SSH..."

                            until ssh -i deploy_key -o StrictHostKeyChecking=no -o BatchMode=yes administrator@$VM_IP "echo ready"
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

        stage('Configure VM') {
            steps {
                dir('ansible') {
                    sh """
                        ansible-playbook \
                        -i "$VM_IP," \
                        -u administrator \
                        --private-key deploy_key \
                        playbook.yml
                    """
                }
            }
        }
    }
}    