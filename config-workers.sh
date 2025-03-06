# Copy from master to node
for node in spark-worker-1 spark-worker-2 spark-worker-3; do
  scp -r $HADOOP_CONF_DIR/* ubuntu@$node:$HADOOP_CONF_DIR/
done
