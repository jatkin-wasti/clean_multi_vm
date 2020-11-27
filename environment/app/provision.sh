#!/bin/bash

# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y

# install git
sudo apt-get install git -y

echo "export DB_HOST='192.168.10.150'" >> ~/.bashrc

# install nodejs
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

# install pm2
sudo npm install pm2 -g

sudo apt-get install nginx -y

# sudo unlink /etc/nginx/sites-enabled/default
# cd /etc/nginx/sites-available
# sudo nano reverse-proxy.conf
# paste this information in with an echo > reverse-proxy.config ???
# server {
#     listen 80;
#     location / {
#         proxy_pass http://development.local:3000/;
#     }
# }
# sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf

# finally, restart the nginx service so the new config takes hold
sudo service nginx restart

# echo "export DB_HOST='192.168.10.100'" >> ~/.bashrc

cd /home/ubuntu/app
sudo npm install
sudo npm start &
