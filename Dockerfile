#Nuestra imagen se construye sobre node
FROM node:14

#Crea la carpeta (si no existe) y en esta guardamos el código
RUN mkdir -p /usr/src/app

#Dentro de la carpeta que hemos creado, es donde nos vamos a mover
WORKDIR /usr/src/app


#Una vez adentro, copiamos el package.json y el package-lock.json
#El ./ significa "carpeta actual"
COPY package*.json ./

#Ejecuta npm install
RUN npm install

#Copia el directorio actual dentro del contenedor actual 
COPY . .

#El puerto que expone este contenedor es el puerto 3000
EXPOSE 3000

#Ejecuta el comando start definido en el package.json
CMD ["npm", "run", "dev"]