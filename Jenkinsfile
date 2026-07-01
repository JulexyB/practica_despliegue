pipeline {
    agent any

    tools {
        nodejs "Node25" // Configura una instalación de Node.js en Jenkins
        dockerTool 'Dockertool'  // Cambia el nombre de la herramienta según tu configuración en Jenkins
    }

    stages {
        stage('Construir Imagen Docker') {
            steps {
                sh "${tool 'Dockertool'}/docker build -t hola-mundo-node:latest ."
            }
        }

        stage('Ejecutar Contenedor Node.js') {
            steps {
                sh """
                        ${tool 'Dockertool'}/docker stop hola-mundo-node || true
                        ${tool 'Dockertool'}/docker rm hola-mundo-node || true
                        ${tool 'Dockertool'}/docker run -d --name hola-mundo-node -p 3000:3000 hola-mundo-node:latest
                    """
            }
        }
    }
}