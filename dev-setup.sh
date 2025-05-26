#!/bin/bash

# Update and upgrade system
sudo apt update && sudo apt upgrade -y

# -----------------------
# Install MongoDB
# -----------------------
echo "Installing MongoDB..."
wget -qO - https://pgp.mongodb.com/server-7.0.asc | sudo gpg --dearmor -o /usr/share/keyrings/mongodb-server-7.0.gpg
echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt update
sudo apt install -y mongodb-org
sudo systemctl enable mongod
sudo systemctl start mongod

# -----------------------
# Install MongoDB Compass
# -----------------------
echo "Installing MongoDB Compass..."
wget https://downloads.mongodb.com/compass/mongodb-compass_1.42.6_amd64.deb -O compass.deb
sudo dpkg -i compass.deb || sudo apt --fix-broken install -y
rm compass.deb

# -----------------------
# Install Studio 3T (free version)
# -----------------------
echo "Installing Studio 3T..."
wget https://download.studio3t.com/studio-3t/linux/studio-3t_2024.1.1_amd64.deb -O studio3t.deb
sudo dpkg -i studio3t.deb || sudo apt --fix-broken install -y
rm studio3t.deb

# -----------------------
# Install MySQL Server and Workbench
# -----------------------
echo "Installing MySQL Server and Workbench..."
sudo apt install -y mysql-server mysql-workbench

# -----------------------
# Install Elasticsearch
# -----------------------
echo "Installing Elasticsearch..."
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo apt install -y apt-transport-https
echo "deb https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
sudo apt update
sudo apt install -y elasticsearch
sudo systemctl enable elasticsearch
sudo systemctl start elasticsearch

# -----------------------
# Install Kibana
# -----------------------
echo "Installing Kibana..."
sudo apt install -y kibana
sudo systemctl enable kibana
sudo systemctl start kibana

# -----------------------
# Install Redis
# -----------------------
echo "Installing Redis..."
sudo apt install -y redis-server
sudo systemctl enable redis-server
sudo systemctl start redis-server

# -----------------------
# Install Redis Insight
# -----------------------
echo "Installing Redis Insight..."
wget https://downloads.redisinsight.redislabs.com/latest/RedisInsight-linux-x86_64.AppImage -O redis-insight.AppImage
chmod +x redis-insight.AppImage
sudo mv redis-insight.AppImage /usr/local/bin/redis-insight

# -----------------------
# Install NVM (Node Version Manager)
# -----------------------
echo "Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Load NVM without restarting shell
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install latest LTS version of Node.js
nvm install --lts
nvm use --lts
nvm alias default 'lts/*'

# -----------------------
# Install Postman
# -----------------------
echo "Installing Postman..."
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
sudo ln -sf /opt/Postman/Postman /usr/bin/postman
rm postman.tar.gz

# Create desktop shortcut for Postman
cat <<EOF | sudo tee /usr/share/applications/postman.desktop > /dev/null
[Desktop Entry]
Name=Postman
GenericName=API Client
Comment=Make and view REST API requests
Exec=/opt/Postman/Postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOF

echo "✅ All tools (including Postman, NVM, Node.js, and more) installed successfully!"

