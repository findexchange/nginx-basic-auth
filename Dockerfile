FROM nginx:1.11.10

COPY nginx.conf /etc/nginx/nginx.conf
COPY bin/* /usr/local/bin/

RUN chmod 744 /usr/local/bin/entry.sh && \
    chown root:root /usr/local/bin/entry.sh

CMD ["/usr/local/bin/entry.sh"]
