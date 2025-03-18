# Download and extract Hadoop 
wget https://dlcdn.apache.org/hadoop/common/hadoop-3.4.0/hadoop-3.4.0.tar.gz
tar -xzf hadoop-3.4.0.tar.gz
sudo mv hadoop-3.4.0 /opt/hadoop
sudo chown -R ubuntu:ubuntu /opt/hadoop

# Set environment variables
echo 'export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64' >> ~/.bashrc
echo 'export HADOOP_HOME=/opt/hadoop' >> ~/.bashrc
echo 'export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin' >> ~/.bashrc
echo 'export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop' >> ~/.bashrc
source ~./bashrc

# Download and extract Spark (do this on all nodes)
#wget https://archive.apache.org/dist/spark/spark-3.5.4/spark-3.5.4-bin-hadoop3.tgz
#tar -xzf spark-3.5.4-bin-hadoop3.tgz
#sudo mv spark-3.5.4-bin-hadoop3 /opt/spark
#sudo chown -R ubuntu:ubuntu /opt/spark

# Set environment variables (add to .bashrc on all nodes)
#echo 'export SPARK_HOME=/opt/spark' >> ~/.bashrc
#echo 'export PATH=$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin' >> ~/.bashrc
#echo 'export PYSPARK_PYTHON=python3' >> ~/.bashrc


source ~/.bashrc

