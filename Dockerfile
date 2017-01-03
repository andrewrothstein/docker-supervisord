FROM andrewrothstein/docker-ansible-onbuild:ubuntu_xenial
ENTRYPOINT ["/usr/local/bin/dumb-init", "-c", "--"]
CMD ["sh", "-l", "-c", "/usr/local/bin/boot-supervisord.sh"]
