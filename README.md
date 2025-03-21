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

### 4.Step: notebooks

simple_data_analysis.ipynb          - data analytics on our reddit dataset

analyze_stocks.ipynb            - test vader and plot semantic analysis results

scalability_tests_with_vader.ipynb  - scalability tests with vader model

scalability_tests.ipynb             - (not used) scalability tests with a very simple semantic analysis 

# Contributions

Dániel Veress: 
- set-up jupyter server and configs
- set-up scalability tests and plots
- wrote scalability test part in presentation
- wrote scalability test part in report

Michel Messo: 
- did preliminary exploration of the dataset
- researched the area and found the VADER implementation
- Wrote dataset part report
- Wrote dataset part in presentation

Junming Ma: 
- preliminary sentiment analysis 
- wrote technology part in presentation
- wrote preliminary analysis part in report

Weiyun Huang: 
- conduct sentiment analysis with vader
- wrote sentiment analysis part in presentation
- wrote sentiment analysis part and part of background in report

Haben Hadush Gebreyowhans:
- designed the cluster architecture (all cluster related shell scripts)(the bash shell script push by daniel(who set up the git) were written by Haben)
- wrote cluster architecture in the presentation
- wrote cluster architectur and data analysis technology in the project report
