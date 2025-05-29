#!/bin/bash

echo "🚀 Начинаем развертывание DocHere на VDS сервере..."

# Проверяем наличие Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker не установлен. Устанавливаем Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    sudo usermod -aG docker $USER
    echo "✅ Docker установлен"
fi

# Проверяем наличие Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose не установлен. Устанавливаем..."
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "✅ Docker Compose установлен"
fi

# Останавливаем существующие контейнеры
echo "🛑 Останавливаем существующие контейнеры..."
docker-compose down 2>/dev/null || true

# Собираем и запускаем новый контейнер
echo "🔨 Собираем Docker образ..."
docker-compose build --no-cache

echo "🚀 Запускаем приложение..."
docker-compose up -d

# Проверяем статус
echo "📊 Проверяем статус контейнера..."
sleep 5
docker-compose ps

# Показываем логи
echo "📝 Последние логи:"
docker-compose logs --tail=20

echo ""
echo "✅ Развертывание завершено!"
echo "🌐 Приложение доступно по адресу: http://$(curl -s ifconfig.me || echo 'your-server-ip')"
echo ""
echo "Полезные команды:"
echo "  docker-compose logs -f    # Просмотр логов в реальном времени"
echo "  docker-compose restart    # Перезапуск"
echo "  docker-compose down       # Остановка" 