#! /bin/bash
echo "--- Idempotent slackspace hiding for demo purposes. Make sure you followed the setup tutorial! ---"
sudo python3 hider.py --target /media/usb_mount_point --purge && sudo python3 hider.py --target /media/usb_mount_point --input test.txt --id 1 && sudo python3 hider.py --target /media/usb_mount_point --output test2.txt --id 1
