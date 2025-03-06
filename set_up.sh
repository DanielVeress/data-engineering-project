#!/bin/bash

echo Execution path: $(pwd)

# Update apt repo metadata: 
sudo apt update

# Install
echo '>> Installing tools...'
sudo apt install -y openjdk-17-jdk
sudo apt install -y net-tools
sudo apt install -y git 
sudo apt install -y python3-pip

# Install pyspark (version must be matched as the Spark cluster), and some other useful deps
echo '>> Installing python packages...'
python3 -m pip install pyspark==3.5.4 --user
python3 -m pip install pandas --user
python3 -m pip install matplotlib --user
python3 -m pip install jupyterlab --user

# Install hadoop
echo '>> Installing hadoop...'
wget https://dlcdn.apache.org/hadoop/common/current/hadoop-3.4.1.tar.gz
mv hadoop-3.4.1.tar.gz ~/
sudo tar xzf ~/hadoop-3.4.1.tar.gz ~/
mv ~/hadoop-3.4.1 ~/hadoop

# Setting up paths
echo 'Setting path envs (JAVA_HOME, PATH, HADOOP_CLASSPATH, HADOOP_HOME)...'
source ~/data-engineering-project/set_up_paths.sh

# Setting up configuration
echo 'Set up /etc/hosts...TODO'
echo 'Set up ~/hadoop/etc/hadoop/core-site.xml...'
cp ~/data-engineering-project/core-site.xml ~/hadoop/etc/hadoop/core-site.xml
echo 'Set up ~/hadoop/etc/hadoop/hdfs-site.xml...'
cp ~/data-engineering-project/hdfs-site.xml ~/hadoop/etc/hadoop/hdfs-site.xml
