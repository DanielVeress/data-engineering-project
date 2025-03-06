# core-site.xml
cat > $HADOOP_CONF_DIR/core-site.xml << EOL
<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://spark-master:8020</value>
    </property>
    <property>
        <name>hadoop.tmp.dir</name>
        <value>/opt/hadoop/tmp</value>
    </property>
</configuration>
EOL

# hdfs-site.xml
cat > $HADOOP_CONF_DIR/hdfs-site.xml << EOL
<configuration>
    <property>
        <name>dfs.replication</name>
        <value>3</value>
    </property>
    <property>
        <name>dfs.namenode.name.dir</name>
        <value>/opt/hadoop/namenode</value>
    </property>
    <property>
        <name>dfs.datanode.data.dir</name>
        <value>/mnt/volume/datanode</value>
    </property>
    <property>
        <name>dfs.blocksize</name>
        <value>128m</value>
    </property>
    <property>
        <name>dfs.permissions</name>
        <value>false</value>
    </property>
</configuration>
EOL

# mapred-site.xml
cat > $HADOOP_CONF_DIR/mapred-site.xml << EOL
<configuration>
    <property>
        <name>mapreduce.framework.name</name>
        <value>yarn</value>
    </property>
    <property>
        <name>mapreduce.application.classpath</name>
        <value>\${HADOOP_HOME}/share/hadoop/mapreduce/*:\${HADOOP_HOME}/share/hadoop/mapreduce/lib/*</value>
    </property>
</configuration>
EOL

# yarn-site.xml
cat > $HADOOP_CONF_DIR/yarn-site.xml << EOL
<configuration>
    <property>
        <name>yarn.nodemanager.aux-services</name>
        <value>mapreduce_shuffle</value>
    </property>
    <property>
        <name>yarn.resourcemanager.hostname</name>
        <value>spark-master</value>
    </property>
    <property>
        <name>yarn.nodemanager.resource.memory-mb</name>
        <value>28672</value>
    </property>
    <property>
        <name>yarn.scheduler.maximum-allocation-mb</name>
        <value>28672</value>
    </property>
    <property>
        <name>yarn.scheduler.minimum-allocation-mb</name>
        <value>1024</value>
    </property>
    <property>
        <name>yarn.nodemanager.resource.cpu-vcores</name>
        <value>14</value>
    </property>
</configuration>
EOL

# workers file
cat > $HADOOP_CONF_DIR/workers << EOL
spark-worker-1
spark-worker-2
spark-worker-2
EOL
