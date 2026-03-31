#!/bin/bash 

check_port() {

	netstat -tuln | grep -q ":$1 "
}
check_port 80 && echo "port is in the use"
