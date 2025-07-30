sudo useradd -m emma
sudo useradd -m noah
sudo useradd -m olivia
sudo useradd -m alice
sudo useradd -m bob

sudo passwd emma
sudo passwd noah

sudo passwd olivia
sudo passwd alice
sudo passwd bob

sudo groupadd -g 4500 developers

getent group developers

sudo usermod -aG developers emma
sudo usermod -aG developers noah

groups emma
groups noah

sudo usermod -g developers olivia

getent group developers
sudo gpasswd -d noah developers
getent group developers




sudo groupadd sharedgrp


sudo usermod -G sharedgrp alice
sudo usermod -aG sharedgrp bob

sudo mkdir /home/shared_folder

sudo chown :sharedgrp /home/shared_folder

sudo chmod 770 /home/shared_folder

# sudo chmod 2770 /home/shared_folder

sudo chmod g+s /home/shared_folder

ls -ld /home/shared_folder


