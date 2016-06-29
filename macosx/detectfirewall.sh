#!/bin/bash   

IP=ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2

echo $IP