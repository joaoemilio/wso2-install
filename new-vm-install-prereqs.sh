sudo yum -y install git
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
sudo /opt/wso2/wso2-install/install-java.sh 8 tar jdk
sudo ln -s /opt/java/jdk1.8.0_172 current
sudo chown -R wso2:wso2 java
sudo su - wso2
cd /opt/wso2
ln -s wso2am-2.2.0 wso2apim 
tar -xvzf ./wso2-install/files/wum-2.0-linux-x64.tar.gz
### EDITAR BASH_PROFILE
vi ~/.bash_profile
source ~/.bash_profile
### wum init , wum add , wum update

## Criar script de environment (agibank-dev-env.sh)

## Criar diretório com o alias /opt/wso2/wso2apim 

## Rodar o script de instalacao
## /opt/wso2/install/wso2-install/resources/setup-apim-2.2.0-publisher.sh /opt/wso2/install/agibank-dev-env.sh
