# Use a basic Linux image
FROM ubuntu:20.04

# Set environment variables for Kafka and Java
ENV KAFKA_VERSION=3.9.0
ENV KAFKA_HOME=/opt/kafka
ENV PATH=$PATH:$KAFKA_HOME/bin

# Install dependencies:
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y curl 
RUN apt-get install -y netcat
RUN apt-get install -y openjdk-17-jre 

# Dynamically set JAVA_HOME based on system architecture
RUN ARCH=$(dpkg --print-architecture) && \
    if [ "$ARCH" = "amd64" ]; then \
        export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64; \
    elif [ "$ARCH" = "arm64" ]; then \
        export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-arm64; \
    else \
        exit 666; \
    fi

ENV JAVA_HOME=${JAVA_HOME}

# Download Kafka 3.9 binaries
RUN wget https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_2.13-${KAFKA_VERSION}.tgz -P /opt && \
    tar -xzf /opt/kafka_2.13-${KAFKA_VERSION}.tgz -C /opt && \
    rm /opt/kafka_2.13-${KAFKA_VERSION}.tgz


RUN mv /opt/kafka_2.13-${KAFKA_VERSION} /opt/kafka

# Expose necessary ports
EXPOSE 9092 9093

# Set the working directory to Kafka
WORKDIR $KAFKA_HOME/bin

# Default command (interactive shell or bash for troubleshooting)
CMD ["/bin/bash"]
