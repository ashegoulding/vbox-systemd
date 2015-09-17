# vbox-systemd
VirtualBox on/off control under systemd!

## Setting up

    # With root,
    ./setup.sh

## Write your own service
Fill out "vbox-template.service" file.

## Register and use

    mv "vbox-your.service" "/etc/systemd/system/"
    systemctl daemon-reload
    systemctl enable "vbox-your.service"
    systemctl start "vbox-your.service"

