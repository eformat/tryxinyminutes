FROM registry.access.redhat.com/ubi9/python-312:latest
USER root
COPY requirements.txt /tmp
RUN pip install --no-cache-dir -r /tmp/requirements.txt && rm -f /tmp/requirements.txt
EXPOSE 3000
USER 1001
COPY ../mkdocs.yml /opt/mkdocs.yml
COPY ../try /opt/try
WORKDIR /opt
CMD [ "mkdocs", "serve" ]
