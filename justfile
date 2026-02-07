# Justfile для управления версиями и релизами
# Использование: just <команда>

# Основные команды
# Показывает доступные команды
default:
    just --list

# Релиз с автоматическим определением типа версии
# Релиз с auto-detection типа версии (по conventional commits)
release:
    npx standard-version

# Релизы с явным указанием типа
# Патч-релиз (0.1.0 → 0.1.1) - bug fixes
release-patch:
    npx standard-version --release-as patch

# Минорный релиз (0.1.0 → 0.2.0) - новые фичи без breaking changes
release-minor:
    npx standard-version --release-as minor

# Мажорный релиз (0.1.0 → 1.0.0) - breaking changes
release-major:
    npx standard-version --release-as major

# Публикация релиза
# Запушить релиз с тегами
publish:
    git push --follow-tags origin main

# Развернуть всю лабу с нуля
up:
    ./run.sh

# Удалить все контейнеры
down:
    ./destroy_infra.sh

# Проверить готовность
test:
    ./test_infra.sh
