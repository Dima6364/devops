#!/bin/bash

# Задаємо URL, який необхідно перевірити
url="http://example.com"

# Отримуємо код відповіді веб-сервера
response=$(curl --write-out %{http_code} --silent --output /dev/null "$url")

# Перевіряємо, чи є код відповіді меншим за 200 або більшим за 399
if [[ "$response" -lt 200 || "$response" -ge 400 ]]; then
    # Якщо так, то відправляємо повідомлення електронної пошти
    echo "Subject: Помилка на сервері\n$(date) - Отримано невірний код відповіді: $response" | ssmtp user@example.com
fi
