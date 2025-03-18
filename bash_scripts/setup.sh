echo updating system
#sudo apt update && sudo apt upgrade -y
echo system updated

echo installing jdk for jvm : 17
sudo apt install -y openjdk-17-jdk
echo installation done


echo  Configure hostnames and hosts file
sudo cat > /etc/hosts << EOL
192.168.2.79 spark-master
192.168.2.18 spark-worker-1
192.168.2.135 spark-worker-2
192.168.2.37 spark-worker-3
EOL

