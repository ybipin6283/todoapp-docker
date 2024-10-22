# alpine - is the light weight linux based os.

# here we have to enter base image of the oerating system that we have to use. to build this image
FROM node:18-alpine AS installer

# initialize the working direcotry
WORKDIR /app

# copy the file from to current working direcotry
COPY package*.json ./

# to execute the command or run the command
RUN npm install

# copy everthing on working direcotry
COPY . .

# build the application source code
RUN npm run build

# run the application 
FROM nginx:latest AS deployer

# everthing will copy on this perticular direcotry
COPY --from=installer app/build /usr/share/nginx/html
