# Візьмемо офіційний образ Magento 2.4.6-p3
FROM ghcr.io/alexcheng1982/docker-magento2:2.4.6-p3

# Встановимо netcat для чекання доступності MySQL
USER root
RUN apt-get update && apt-get install -y netcat && apt-get clean

# Копіюємо стартовий скрипт і робимо його виконуваним
COPY ./setup-magento.sh /setup-magento.sh
RUN chmod +x /setup-magento.sh

# Повертаємось до користувача www-data (якщо потрібно)
USER www-data

# Запускати setup скрипт при старті контейнера
CMD ["/setup-magento.sh"]
