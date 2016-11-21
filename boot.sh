#!/usr/bin/env bash
for i in $(ls /etc/supervisor/profile.d/*.sh 2>/dev/null | sort) ; do
    if [ -r "$i" ]; then
	. $i
    fi
done

/usr/local/bin/supervisord -c /etc/supervisor/supervisord.conf
