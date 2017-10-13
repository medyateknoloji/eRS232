#!/bin/bash
echo "Guncelleme basliyor..."
sudo rm /boot/cmdline.txt
echo "cmdline.txt silindi"
sudo touch /boot/cmdline.txt
echo "cmdline.txt olusturuldu"
sudo sh -c "echo 'consoleblank=1 logo.nologo dwc_otg.lpm_enable=0 console=tty1 root=PARTUUID=84fa8189-02 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait  quiet   plymouth.ignore-serial-consoles
 loglevel=1 quiet' >> /boot/cmdline.txt"
echo "cmdline.txt duzenlendi"
sudo echo "enable_uart=1" >> /boot/config.txt
echo "config.txt duzenlendi"
echo "pyserial kutuphanesi kuruluyor..."
sudo python -m pip install pyserial
cp ../eRS232/TVon.py ../TVon.py
cp ../eRS232/TVoff.py ../TVoff.py
echo "Dosyalar kopyalandi..."
echo "crontab ekleniyor..."
sudo touch /var/spool/cron/crontabs/pi
sudo echo "# m h  dom mon dow   command" >> /var/spool/cron/crontabs/pi
sudo echo "@reboot python /home/pi/TVon.py " >> /var/spool/cron/crontabs/pi
sudo echo "00 04 * * * sudo reboot " >> /var/spool/cron/crontabs/pi
sudo reboot





