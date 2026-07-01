# Dockerfile
FROM node:22

# Crear directorio de la aplicación
WORKDIR /usr/src/app

# Copiar archivos al contenedor
COPY package*.json ./
COPY index.js .

# Instalar dependencias
RUN npm install -g npm@latest
RUN npm install --no-audit --no-fund --legacy-peer-deps

# Exponer el puerto de la aplicación
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["node", "index.js"]