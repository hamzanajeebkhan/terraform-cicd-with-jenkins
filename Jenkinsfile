pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
/*
        stage('Install Terraform') {
            steps {
                
                sh 'apt-get update && apt-get install -y gnupg software-properties-common'
                sh '''
                wget -O- https://apt.releases.hashicorp.com/gpg | \
                    gpg --dearmor | \
                    tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
                '''
                sh 'apt update'
                sh 'apt-get install terraform'
                
            }
        }
        
        stage('Install AWS') {
            steps {
                sh '''
                    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
                    unzip awscliv2.zip
                    ./aws/install
                '''
            }
        }
*/
        stage('Run Terraform Init') {
            steps {
                sh '''
                    terraform init
                '''
            }
        }

        stage('Run Terraform Plan') {
            steps {
                sh '''
                    terraform plan
                '''
            }
        }
        
        stage('Run Terraform Apply / Destroy') {
            steps {
                sh '''
                echo "Testing"
                '''
            }
        }
        
    }
}