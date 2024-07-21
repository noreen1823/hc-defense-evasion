# Hiding information in the Slack

## Disclaimer

The code presented was only tested, and is only compatible with, an ext4 system with the current (as of date) Kali linux version. Do not use this code with other filesystems like btrfs. Also do not test this on your normal drive. Always create a virtual, empty thump drive. Although unlikely you may loose data otherwise.

## Credits

This repository is based on [this article](https://zachary-parish.medium.com/hiding-data-in-file-slack-space-using-python-linux-c773a8315)

> [1]Z. Parish, “Hiding Data in File Slack Space Using Python (Linux),” Medium, Apr. 07, 2021. > https://zachary-parish.medium.com/hiding-data-in-file-slack-space-using-python-linux-c773a8315
‌

[Original repository](https://github.com/exembly/slack_hider)

Much thanks to the authors for providing us with the necessary tools 

## Setup
First of course we need to clone this repository if not already done
```bash
#Clone this repository
git clonr https://github.com/noreen1823/hc-defense-evasion.git
```

For this setup we'll create a new, clear filesystem to not mess with your current drive and then fill it with testfiles

```bash
# Use fallocate to create a new file
fallocate -l 4000M Virtual_usb.img

# Create a file system
mkfs -t ext4 Virtual_usb.img

# Create a mount point 
sudo mkdir /media/usb_mount_point

# mount it
sudo mount -t auto -o loop Virtual_usb.img /media/usb_mount_point

# Create required directory
sudo mkdir /media/usb_mount_point/staging

# Download a testfile (gutenberg books (copyright free))
sudo wget https://raw.githubusercontent.com/dscape/spell/master/test/resources/big.txt -o "/media/usb_mount_point/big.txt"

# Split the file into 300 pieces to create a lot of slack space
sudo split -l 300 /media/usb_mount_point/big.txt
```
[Used stack overflow post](https://unix.stackexchange.com/questions/328156/create-virtual-usb-drive)

You should now have a 4GB big ext4 file system at /media/usb_mount_point you can interact with, filled with enough files to have a decend amount of slackspace. In case you want to store larger files you can always repeat the download and split process and thus create more slackspace to use. You can also increase the split size from, for example 300 to 600.

```bash
# Create test file to read into slack space
echo "Hello, world" > test.txt

# Clear slack space, write 0 into it
sudo python3 hider.py --purge 

# Write test.txt to slac space slot 1 (max 255 slots)
sudo python3 hider.py --target /media/usb_mount_point --input test.txt --id 1 

# Read slack space content with id 1 into test2.txt. The slackspace content gets automatically cleared after you read it.
sudo python3 hider.py --target /media/usb_mount_point --output test2.txt --id 1
```

You successfully just wrote and read your first textfile using the slackspace