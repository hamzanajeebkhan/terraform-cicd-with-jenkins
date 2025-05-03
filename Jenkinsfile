pipeline {
    agent any

    parameters {
        choice choices: ['apply', 'destroy'], description: 'Select the choice to apply or destroy terraform infrastructure', name: 'Terraform_Command'
        booleanParam defaultValue: true, description: 'Use this to see terraform plan only.', name: 'dryRun'
    }

    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        DRY_RUN = "${params.dryRun}"
    }

    tools {
        terraform 'Terraform'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Run Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Run Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        
        stage('Run Terraform Apply / Destroy') {
            when { environment name: 'DRY_RUN', value: 'false'}
            steps {
                script {
                    sh "terraform ${params.Terraform_Command} -auto-approve"
                }
            }
        }
        
    }
}