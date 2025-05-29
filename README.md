# DocHere - Vue.js приложение

Медицинский сервис для поиска врачей и записи на прием.

## Технологии

- **Frontend**: Vue.js 3 + Vue Router
- **Build Tool**: Vite
- **Web Server**: Nginx
- **Контейнеризация**: Docker + Docker Compose

## Структура проекта

```
├── src/
│   ├── components/
│   │   ├── Home.vue          # Главная страница
│   │   └── Results.vue       # Страница результатов поиска
│   ├── App.vue               # Главный компонент
│   ├── main.js               # Точка входа
│   └── style.css             # Стили
├── public/
│   └── img/                  # Изображения
├── Dockerfile                # Docker конфигурация
├── docker-compose.yml        # Docker Compose конфигурация
├── nginx.conf                # Конфигурация Nginx
├── nginx-ssl.conf            # Конфигурация Nginx с SSL
├── .gitignore                # Git ignore файл
├── env.example               # Пример переменных окружения
└── package.json              # Зависимости Node.js
```

## Настройка переменных окружения

1. **Скопируйте пример файла:**
   ```bash
   cp env.example .env
   ```

2. **Отредактируйте переменные в `.env`:**
   ```bash
   # Основные настройки
   NODE_ENV=production
   VITE_APP_TITLE=DocHere
   VITE_API_URL=https://your-api-domain.com/api
   ```

## Развертывание на VDS сервере

### Предварительные требования

1. Установленный Docker и Docker Compose на сервере
2. Открытый порт 80 (или другой по вашему выбору)
3. Настроенные переменные окружения

### Шаги развертывания

1. **Клонируйте проект на сервер:**
   ```bash
   git clone <your-repo-url>
   cd dochere-vue
   ```

2. **Настройте переменные окружения:**
   ```bash
   cp env.example .env
   nano .env  # Отредактируйте под ваши нужды
   ```

3. **Соберите и запустите контейнер:**
   ```bash
   docker-compose up -d --build
   ```

4. **Проверьте статус:**
   ```bash
   docker-compose ps
   ```

5. **Просмотр логов:**
   ```bash
   docker-compose logs -f
   ```

### Альтернативный способ (только Docker)

```bash
# Сборка образа
docker build -t dochere-vue .

# Запуск контейнера
docker run -d -p 80:80 --name dochere-app dochere-vue
```

## Локальная разработка

1. **Установка зависимостей:**
   ```bash
   npm install
   ```

2. **Настройка переменных окружения:**
   ```bash
   cp env.example .env
   ```

3. **Запуск dev сервера:**
   ```bash
   npm run dev
   ```

4. **Сборка для продакшена:**
   ```bash
   npm run build
   ```

## Конфигурация Nginx

Приложение настроено как SPA (Single Page Application) с поддержкой:
- Сжатия gzip
- Кеширования статических файлов
- Безопасности заголовков
- Перенаправления всех маршрутов на index.html

### SSL/HTTPS настройка

Для включения HTTPS используйте `nginx-ssl.conf`:

1. **Получите SSL сертификаты** (Let's Encrypt, Cloudflare и т.д.)
2. **Замените пути к сертификатам** в `nginx-ssl.conf`
3. **Обновите Dockerfile** для использования SSL конфигурации:
   ```dockerfile
   COPY nginx-ssl.conf /etc/nginx/nginx.conf
   ```

## Управление контейнером

```bash
# Остановка
docker-compose down

# Перезапуск
docker-compose restart

# Обновление (пересборка)
docker-compose down
docker-compose up -d --build

# Просмотр логов
docker-compose logs -f dochere-app

# Просмотр использования ресурсов
docker stats dochere-app
```

## Git workflow

```bash
# Инициализация репозитория
git init
git add .
git commit -m "Initial commit"

# Добавление удаленного репозитория
git remote add origin <your-repo-url>
git push -u origin main

# Обновление на сервере
git pull origin main
docker-compose up -d --build
```

## Переменные окружения

### Основные переменные:
- `NODE_ENV` - Режим работы (development/production)
- `VITE_APP_TITLE` - Название приложения
- `VITE_API_URL` - URL API сервера

### Дополнительные переменные:
- `VITE_API_TIMEOUT` - Таймаут API запросов
- `CORS_ORIGIN` - Разрешенные домены для CORS
- `RATE_LIMIT_MAX` - Лимит запросов

Полный список переменных смотрите в файле `env.example`.

## Порты

- **Приложение**: 80 (HTTP)
- **Dev сервер**: 3000 (только для разработки)
- **HTTPS**: 443 (при использовании SSL)

## Особенности

- Адаптивный дизайн
- Vue Router для навигации
- Реактивные формы поиска
- Компонентная архитектура
- Оптимизированная сборка для продакшена
- Готовность к SSL/HTTPS
- Автоматическое развертывание через Docker

## Мониторинг и логи

```bash
# Просмотр логов приложения
docker-compose logs -f dochere-app

# Просмотр логов Nginx
docker exec -it dochere-vue-app tail -f /var/log/nginx/access.log
docker exec -it dochere-vue-app tail -f /var/log/nginx/error.log

# Мониторинг ресурсов
docker stats dochere-vue-app
``` 