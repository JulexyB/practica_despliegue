# Dockerfile
FROM node:22

# Crear directorio de la aplicación
WORKDIR /usr/src/app

# Copiar archivos al contenedor
COPY package*.json ./
COPY . .

# Instalar dependencias
RUN npm install -g npm@latest
RUN npm config set strict-ssl false
RUN npm install --include=dev --no-audit --no-fund

# Exponer el puerto de la aplicación
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["node", "index.js"]