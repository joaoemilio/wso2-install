sudo yum install git
sudo yum -y install unzip 
sudo yum -y install telnet
sudo yum -y install wget
sudo useradd wso2
cd /opt
sudo mkdir wso2
sudo chown wso2:wso2 wso2
sudo su - wso2
cd /opt/wso2 
git clone https://github.com/joaoemilio/wso2-install.git
exit
cd /opt/
sudo mkdir java
cd java
sudo ./wso2/wso2-install/install-java.sh 8 tar jdk
sudo ln -s /opt/java/jdk1.8.0_172 current
sudo chown -R wso2:wso2 java
sudo su - wso2
cd /opt/wso2
tar -xvzf ./wso2-install/files/wum-2.0-linux-x64.tar.gz
### EDITAR BASH_PROFILE