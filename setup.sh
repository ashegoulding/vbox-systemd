#!/bin/bash
if [ $UID != 0 ]; then
	echo "Do you even root bro?" >& 2
	exit 1
fi
mkdir -p /var/lib/vbox-systemd/
cp vbox-run.sh /var/lib/vbox-systemd/

