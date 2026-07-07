pipeline {
    agent any

    options {
        timestamps()
    }

    tools {
        nodejs "Node25"
        dockerTool 'Dockertool'
    }

    stages {
        stage('Construir Imagen Docker') {
            steps {
                sh """
                    echo 'Construyendo imagen Docker...'
                    ${tool 'Dockertool'}/docker build -t hola-mundo-node:latest .
                """
            }
        }

        stage('Ejecutar Contenedor Node.js') {
            steps {
                sh """
                    echo 'Iniciando contenedor...'
                    ${tool 'Dockertool'}/docker stop hola-mundo-node || true
                    ${tool 'Dockertool'}/docker rm hola-mundo-node || true
                    ${tool 'Dockertool'}/docker run -d --name hola-mundo-node -p 3000:3000 hola-mundo-node:latest
                    echo 'Mostrando logs del contenedor...'
                    ${tool 'Dockertool'}/docker logs hola-mundo-node
                """
            }
        }

        stage('Ejecutar tests') {
            steps {
                sh """
                    echo 'Ejecutando pruebas dentro del contenedor...'
                    ${tool 'Dockertool'}/docker run --rm hola-mundo-node:latest npm test
                """
            }
        }
    }

    post {
        always {
            sh """
                ${tool 'Dockertool'}/docker rm -f hola-mundo-node || true
            """
        }
    }
}