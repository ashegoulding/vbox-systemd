#!/bin/bash
B_HEADLESS="vboxheadless"
B_MANAGE="vboxmanage"

function __help()
{
	cat << EOT
Usage: $0 <VM name> <act:start|stop|reset|kill>

- start: Start the saved or poweroff VM.
- stop: Save the state and then stop.
- reset: Resets the VM.
- kill: Terminate the VM.
<act> is case-insensitive.
EOT
}

SUBJECT=""
ACT=""
if [ -n "$1" ]; then
	SUBJECT="$1"
fi
if [ -n "$2" ]; then
	ACT="${2,,}"
fi

while [ true ]
do
	if [ -z "$SUBJECT" ]; then
		break
	fi

	if [ "$ACT" == "start" ]; then
		$B_HEADLESS --startvm sandbox
	elif [ "$ACT" == "stop" ]; then
		$B_MANAGE controlvm sandbox savestate
	elif [ "$ACT" == "reset" ]; then
		$B_MANAGE controlvm sandbox reset
	elif [ "$ACT" == "kill" ]; then
		$B_MANAGE controlvm sandbox poweroff
	else
		break
	fi
	exit 0
done

__help
exit 1

