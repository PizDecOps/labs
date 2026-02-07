#!/bin/bash
for i in {1..10}; do
    if lxc info student-$i >/dev/null 2>&1; then
        echo "Контейнер student-$i уже запущен, пропускаем создание..."
    else
        echo "Запуск контейнера student-$i..."
        lxc launch ubuntu:22.04 student-$i
    fi

    echo "Полная зачистка и настройка student-$i..."

    lxc exec student-$i -- sh -c 'echo "Acquire::ForceIPv4 \"true\";" > /etc/apt/apt.conf.d/99force-ipv4'

    lxc exec student-$i -- systemctl stop apt-daily.service apt-daily-upgrade.service unattended-upgrades.service >/dev/null 2>&1 || true
    lxc exec student-$i -- apt-get purge -y unattended-upgrades >/dev/null 2>&1 || true

    lxc exec student-$i -- pkill -9 apt || true
    lxc exec student-$i -- pkill -9 dpkg || true

    lxc exec student-$i -- rm -f /var/lib/dpkg/lock-frontend /var/lib/dpkg/lock /var/lib/apt/lists/lock /var/cache/apt/archives/lock

    lxc exec student-$i -- dpkg --configure -a

    lxc exec student-$i -- sh -c 'while fuser /var/lib/dpkg/lock-frontend >/dev/null 2>&1; do echo -n "."; sleep 1; done'

    echo " student-$i готов к работе!"
done
