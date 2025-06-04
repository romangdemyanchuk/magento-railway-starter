# Візьмемо офіційний образ Magento 2.4.6-p3
RUN apt-get update && apt-get install -y mysql-client

FROM ghcr.io/alexcheng1982/docker-magento2:2.4.6-p3

# Копіюємо стартові скрипти (якщо потрібно)
COPY ./setup-magento.sh /setup-magento.sh
RUN chmod +x /setup-magento.sh

# Запускати setup скрипт при старті контейнера (опціонально)
CMD ["/setup-magento.sh"]
