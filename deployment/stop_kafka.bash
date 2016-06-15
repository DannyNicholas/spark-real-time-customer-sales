#!/bin/bash

APACHE_KAFKA_DIR="/Users/Danny/deploy/claritize/lib/third-party/kafka_2.11-0.9.0.0"

if [ -z "$APACHE_KAFKA_DIR" ] ; then
        "echo WARNING - APACHE_KAFKA_DIR NOT SET. CAN NOT START KAFKA"
else

    if [ ! -d "$APACHE_KAFKA_DIR" ]; then
        echo -e "FATAL: Could not find Apache Kafka at: \t\t\t\t${APACHE_KAFKA_DIR}"
        echo
        exit 1
    else
        echo -e "INFO: Apache Kafka installed to: \t\t\t\t${APACHE_KAFKA_DIR}"
    fi

    stop_zookeeper_command="${APACHE_KAFKA_DIR}/bin/zookeeper-server-stop.sh"
    stop_kafka_command="${APACHE_KAFKA_DIR}/bin/kafka-server-stop.sh"
 
    # If stopping - Kafka must stop before Zookeeper
    echo "Stopping Kafka then Zookeeper...."
    echo ${stop_kafka_command}
    eval ${stop_kafka_command}

    echo ${stop_zookeeper_command}
    eval ${stop_zookeeper_command}
fi
