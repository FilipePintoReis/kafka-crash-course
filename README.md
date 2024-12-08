# Apache Kafka
Welcome to this Kafka crash course.

## What's happening here?
This docker compose file is setting up a Kafka cluster in Raft mode.
The compose file contains 3 different processes:
- A Broker
- A Controller
- A Linux VM with Kafka installed, to serve as a client.

## Prerequisites
Have docker and docker compose installed.
I suggest trying the steps on the **How to run** section before arriving.

This has been tested in MacOS, I'm assuming there would be no changes for any other Linux based system.  

Godspeed to Windows Users. I'm only half joking, some workarounds might be needed around file separators, running commands, installing docker, etc.

## How to run
Open 3 terminals.
1. Terminal 1, run `./pre_docker_compose.sh`. Use good judgement and amount of errors to discern if everything worked.
2. Terminal 2, wait the cluster to spin up:
2.1 Connect to the client: `docker exec -it kafka_client /bin/bash`
2.2 Create a topic: `/kafka-topics.sh --create --topic test --bootstrap-server kafka_broker:9092 --partitions 1 --replication-factor 1`
2.3 Open a console producer for `test` topic: `./kafka-console-producer.sh --broker-list kafka_broker:9092 --topic test`
2.4 Complete steps 3. through 3.2 and then come back here.
2.5 Write your first message to the `test` topic. See the message in terminal 3.
3. Terminal 3, wait the cluster to spin up:
3.1 Connect to the client: `docker exec -it kafka_client /bin/bash`
3.2 Open a console consumer for `test` topic: `./kafka-console-consumer.sh --bootstrap-server kafka_broker:9092 --topic test`

## Fun Challenge Ideas

### Walk in the park
1. Create a new topic with many partitions.  
2. List topics.  
3. Learn the difference between static and dynamic configurations.  
4. Describe topics and change their configurations.  
5. Update the retention period of a topic to be a few seconds, write to the topic, see message appearing, wait for the said retention period, restart your consumer with the a "-from-beginning" flag and see that the messages no longer appear.  

### Rocky is the road of the wisdom seeker
1. Follow The Best Practices: Change the docker compose to have 3 brokers and 3 controllers.  
2. The Legacy is Alive: Re-create the docker compose to use Zookeeper instead of the Raft protocol.  
3. I Dislike Manual Work: Choose your favorite programming language to create a client. Produce to this cluster.  
4. Reinvent the Wheel: Ignore everything that was done here. Setup your own cluster, your own way.  
4. Security First: Use any secure communication protocol instead of plaintext.  

### LinkedIn post worthy
1. Disposable Machines: Create a cluster with 3 brokers and 3 controllers. Use more than one computer.   
1.1 Tip: Some cloud computing services have free-tiers and also give credits to students.  
2. Hard-coding is Shameful: Write a program that takes the number of brokers and controllers as an argument and spins up a cluster.  
3. I Am More Than a Code Monkey: Think of a company and create a case-study explaining how Kafka could be useful for this company. Approach this with a half-business half-design mindset. Some points to approach:  
3.1 What does the business do?  
3.3 What applications produce data and what applications need it?   
3.4 What topics would you create to model that?  
3.5 How would you configure the cluster and producers, outside of the default? Why?   

### Links
https://aws.amazon.com/what-is/apache-kafka/
https://kafka.apache.org/
https://cwiki.apache.org/confluence/display/KAFKA/Kafka+Improvement+Proposals
https://github.com/apache/kafka

