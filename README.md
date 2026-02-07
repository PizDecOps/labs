# Bash Workshop Lab Infrastructure

Инфраструктура на 10 LXC-контейнеров для обучения основам Linux и Bash.

## Использование

1. **Поднять контейнеры:** `./deploy_infra.sh`
2. **Настроить софт и юзеров:** `ansible-playbook site.yml --ask-vault-pass`
3. **Пробросить порты наружу:** `sudo ./setup_network.sh`

## Подключение

Студенты заходят по SSH:
`ssh student@<your_ip> -p 2201` (для 1-го студента)
...и так далее до `2210`.
