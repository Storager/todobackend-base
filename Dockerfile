FROM python:2

# Prevent dpkg errors
ENV TERM=xterm-256color

# # Set mirrors to EE
# RUN sed -i "s/http:\/\/archive./http:\/\/ee.archive./g" /etc/apt/sources.list

# RUN apt-get update && \
#     apt-get install -y \
#     -o APT::Install-Recommend=false -o APT::Install-Suggests=false \
#     python python-virtualenv python-pip

RUN virtualenv /appenv && \
    . /appenv/bin/activate && \
    pip install pip --upgrade

ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]