FROM andrewrothstein/docker-ansible:centos_7
MAINTAINER "Andrew Rothstein" andrew.rothstein@gmail.com

COPY requirements.yml requirements.yml
RUN ansible-galaxy install -r requirements.yml

COPY playbook.yml playbook.yml
RUN ansible-playbook playbook.yml

ENTRYPOINT ["/usr/local/bin/dumb-init", "-c", "--"]
CMD ["sh", "-l", "-c", "/usr/local/bin/boot-supervisord.sh"]
