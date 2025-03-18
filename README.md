# data-engineering-project

### 1.Step: set-up nodes

Run the following scripts in the bash_scripts folder one time to set-up the cluster: 

A) setup.sh 
    - download **jdk** and configure **hostnames** and 
    
B) hadoop_setup.sh
    - download **hadoop**, **spark** and set-up **environment variables**
    
C) config-workers.sh
    - set-up **configuration** for 3 worker nodes
    
D) config-hadoop-spark-maset.sh
    - set-up **configuration** for master
    
E) jupyter_setup.sh
    - set-up **jupyter lab** on master

add_node.sh (optional)
- adds **new node** to cluster

### 2.Step: set-up port forwarding locally

Based on step 1 in:

https://github.com/usamazf/DE1-Spark/blob/main/DE-2025/guides/spark-driver-deploy-instruction.md

Then you can ssh like in step 2 of the document.

You can access:
- jupyter from: https://localhost:[PORT]/lab
- spark master: http://localhost:8080/
- hadoop: http://localhost:9870

### 4.Step: data processing

TODO

### 5.Step: analyse scalabiltiy

TODO

# Contributions

TODO