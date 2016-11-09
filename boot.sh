#!/usr/bin/env bash
if [-d /etc/supervisor/profile.d]; then
    for i in $(ls /etc/supervisor/profile.d/*.sh | sort) ; do
	if [ -r "$i" ]; then
	    . $i
	fi
    done
fi

/usr/local/bin/supervisord -c /etc/supervisor/supervisor.conf
