FROM andrewrothstein/docker-ansible:ubuntu_xenial
MAINTAINER "Andrew Rothstein" andrew.rothstein@gmail.com

COPY requirements.yml requirements.yml
RUN ansible-galaxy install -r requirements.yml

COPY playbook.yml playbook.yml
RUN ansible-playbook playbook.yml

ENTRYPOINT ["/usr/local/bin/dumb-init", "-c", "--"]

COPY boot.sh /usr/local/bin/boot.sh
CMD ["/usr/local/bin/boot.sh"]
