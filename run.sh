#!/bin/bash
set -e

echo "Начинаем развертывание лаборатории..."

./deploy_infra.sh

echo "Настройка конфигурации (потребуется пароль Vault)..."
ansible-playbook site.yml --ask-vault-pass

echo "Настройка проброса портов..."
sudo ./setup_network.sh

echo "Все готово! Студенты могут подключаться."
