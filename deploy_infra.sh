#!/bin/bash
for i in {1..10}; do
    echo "Запуск контейнера student-$i..."
    lxc launch images:ubuntu/22.04 student-$i
    sleep 2
done
