#!/bin/bash
echo "Удаление всех контейнеров student-1..10..."
for i in {1..10}; do
    lxc delete -f student-$i 2>/dev/null || echo "Контейнер student-$i не найден"
done
echo "Готово."
