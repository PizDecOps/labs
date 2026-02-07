#!/bin/bash
echo "Проверка доступности портов SSH (2201-2210)..."
for i in {1..10}; do
    PORT=$((2200 + i))
    (echo > /dev/tcp/127.0.0.1/$PORT) >/dev/null 2>&1 && echo "Порт $PORT открыт" || echo "Порт $PORT закрыт"
done

echo -e "Проверка создания пользователя student внутри контейнеров..."
for i in {1..10}; do
    lxc exec student-$i -- id student >/dev/null 2>&1 && echo "student-$i: OK" || echo "student-$i: FAIL"
done
