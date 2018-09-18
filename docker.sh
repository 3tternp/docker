#! /bin/bash
while true ;
do
echo -e "\033[30m"
echo -e "Choose the operation you want to  perform ? ""\033[31m"
echo -e "1. Install Docker " "\033[32m"
echo -e "2. Remove Docker " "\033[34m"
echo -e "\033[29m"

read count
if [ $count -eq 1 ]
then
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo 'deb https://download.docker.com/linux/debian stretch stable' > /etc/apt/sources.list.d/docker.list
sudo apt-get update -y && 
sudo apt-get install docker-ce -y
sudo apt-get install docker.io -y
sudo apt-get install docker  -y 
sudo apt-get install docker-compose -y  

echo "Do you wish to enable docker upon reboot(at your own risk!)"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) systemctl enable docker; break;;
        No ) exit;;
    esac
done
exit

elif [ $count -eq 2 ]
then
sudo apt-get autoremove docker docker-engine docker.io  -y 
exit

else 
exit

 fi
done



