#!/bin/bash

# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y

# install git
sudo apt-get install git -y
# export the ip address of the db in the bashrc file as an environment variable
echo "export DB_HOST='192.168.10.150'" >> ~/.bashrc
source ~/.bashrc

# install nodejs
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

# install pm2
sudo npm install pm2 -g
# install nginx
sudo apt-get install nginx -y

# Commented out instructions to set up the reverse proxy manually just in case something goes wrong!
# sudo unlink /etc/nginx/sites-enabled/default
# cd /etc/nginx/sites-available
# sudo nano reverse-proxy.conf
# paste this information into the file
# server {
#     listen 80;
#     location / {
#         proxy_pass http://192.168.10.100:3000/;
#     }
# }
# sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf

# disabling the default virtual host
sudo unlink /etc/nginx/sites-enabled/default
# setting up our new config file in the sites-available directory
sudo cp /home/ubuntu/app/reverse-proxy.conf /etc/nginx/sites-available/
# creating a symbolic link to the sites-enabled directory to enable this new config file
sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf

# finally, restart the nginx service so the new config takes hold
sudo service nginx restart
# cd into the correct directory and then start the app
cd /home/ubuntu/app
sudo npm install
sudo npm start &
