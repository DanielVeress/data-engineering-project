#!/bin/bash

sudo apt install -y python3-pip
python3 -m pip install pyspark==3.5.4 --user
python3 -m pip install pandas --user
python3 -m pip install matplotlib --user

python3 -m pip install jupyterlab --user

echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# generate config file
jupyter server --generate-config

# setup password
# it asks for the password and saves the hashed version into config
jupyter server password

# generates key and certificate for jupyter server to use
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout jupy_key.key -out jupy_cert.pem

# setup config file
echo "c.ServerApp.certfile = u'/home/ubuntu/jupy_cert.pem'" >> ~/.jupyter/jupyter_server_config.py
echo "c.ServerApp.keyfile = u'/home/ubuntu/jupy_key.key'" >> ~/.jupyter/jupyter_server_config.py
echo "c.ServerApp.open_browser = False" >> ~/.jupyter/jupyter_server_config.py
