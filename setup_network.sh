#!/bin/bash
EXTERNAL_IP=$(hostname -I | awk '{print $1}')
for i in {1..10}; do
    PORT=$((2200 + i))
    echo "Forwarding $EXTERNAL_IP:$PORT to student-$i:22"
    lxc config device add student-$i proxy-ssh proxy listen=tcp:0.0.0.0:$PORT connect=tcp:127.0.0.1:22
done
