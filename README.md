# Magento 2.x - Docker setup guide
> Author: Alessio Debernardi Venon

## 1. Download Magento
Download the official Magento zip package https://magento.com/tech-resources/download and place it in the same directory of the Dockerfile.

If this is a new project:
- Extract the "app" directory from the zip package and place it in the same directory of the Dockerfile.
- Extract "composer.json" and "composer.lock" files from the zip package and place them in the same directory of the Dockerfile.

## 2. Setup environment variables
Clone the '.env-example' file and rename it as '.env'.
Customize the configuration variables inside the .env file (container ports, database password, etc) 

## 3. Run the docker-compose command
Run `docker-compose up` to build and run the containers

## 4. Run the Magento setup
Go to http://localhost:[custom-port] and proceed with the setup wizard

### Useful commands
- (Build and) Run the containers: `docker-compose up`
- Stop the containers: `docker-compose stop`
- Stop and delete containers `docker-compose down`
- Open terminal inside specific container `docker exec -it [container-name] bash`
- Install/update dependancies from composer: `docker exec [container-name] bash -c 'cd /var/www/html && composer install'`