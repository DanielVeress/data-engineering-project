# automate the process of adding a new worker node / datanode to group 8 cluster #

if [ $# -ne 2 ]; then
    echo "Usage: $0 <worker_id> <worker_ip>"
    echo "Example: $0 3 192.168.1.103"
    exit 1
fi

#add worker details
WORKER_ID=$1
WORKER_IP=$2
WORKER_HOSTNAME="spark-worker-$WORKER_ID"

#check if the stated node can be reachable
echo "pinging to $WORKER_IP..."
if ping -c 3  -q $WORKER_IP > /dev/null 2>&1; then
   echo "Connectivity test successful! The host $WORKER_IP is reachable."
else
   echo "Connectivity test failed! Could not reach $WORKER_IP."
   exit 1
fi

#adding configire to master
HOSTS_FILE="/etc/hosts"
SSH_CONFIG_FILE="$HOME/.ssh/config"
SPARK_CONF_DIR="/opt/spark/conf"
WORKERS_FILE="$SPARK_CONF_DIR/workers"

echo "Adding worker to $HOSTS_FILE..."
if grep -q "$WORKER_HOSTNAME" $HOSTS_FILE; then
    echo "Worker already exists in $HOSTS_FILE. skippping..."
    exit 1
else
    echo "Adding new worker entry to $HOSTS_FILE..."
    echo "$WORKER_IP $WORKER_HOSTNAME" | sudo tee -a $HOSTS_FILE > /dev/null
fi

# confure ssh of the new node 
echo "Configuring SSH for the worker..."
if grep -q "Host $WORKER_HOSTNAME" $SSH_CONFIG_FILE; then
    echo "SSH config for $WORKER_HOSTNAME already exists. Skipping..."
else
    echo "Adding SSH config for $WORKER_HOSTNAME..."
    cat << EOF >> $SSH_CONFIG_FILE
Host $WORKER_HOSTNAME
    HostName $WORKER_IP
    User spark
    IdentityFile ~/.ssh/id_rsa
EOF
fi

echo "Copying SSH key to the worker..."
if ssh-copy-id -i ~/.ssh/id_rsa.pub "spark@$WORKER_IP"; then
    echo "SSH key copied successfully."
else
    echo "Error copying SSH key"
    exit 1
fi

# Add worker to Spark workers file
echo "Adding worker to Spark configuration..."
if grep -q "$WORKER_HOSTNAME" $WORKERS_FILE; then
    echo "Worker already exists in $WORKERS_FILE. Skipping..."
else
    echo "Adding $WORKER_HOSTNAME to $WORKERS_FILE..."
    echo "$WORKER_HOSTNAME" | sudo tee -a $WORKERS_FILE > /dev/null
fi

# Test SSH connection to the worker
echo "Testing SSH connection to $WORKER_HOSTNAME..."
if ssh spark@$WORKER_HOSTNAME "echo 'SSH connection successful'"; then
    echo "SSH connection test passed."
else
    echo "SSH connection test failed. Please check the configuration."
    exit 1
fi

echo " $WORKER_HOSTNAME has been successfully added to the cluster"
echo "You may need to restart Spark services for changes to take effect:"
echo "  $ $SPARK_CONF_DIR/../sbin/stop-all.sh"
echo "  $ $SPARK_CONF_DIR/../sbin/start-all.sh"

exit 0

