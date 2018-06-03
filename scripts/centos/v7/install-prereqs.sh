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
mkdir install
cd install
git clone https://github.com/joaoemilio/wso2-install.git
exit
cd /opt/
sudo mkdir java
cd java
sudo /opt/wso2/install/wso2-install/install-java.sh 8 tar jdk
sudo mv ../jdk1.8.0_172 ./
sudo ln -s /opt/java/jdk1.8.0_172 current
sudo chown -R wso2:wso2 /opt/java
sudo su - wso2
cd /opt/wso2
ln -s wso2am-2.2.0 wso2apim 
tar -xvzf ./install/wso2-install/files/wum-2.0-linux-x64.tar.gz
### EDITAR BASH_PROFILE
cat ./install/wso2-install/resources/centos7/wso2_bash_profile > ~/.bash_profile
source ~/.bash_profile
### wum init , wum add , wum update
#wum init
#wum add wso2am-2.2.0
#wum add wso2is-km-5.5.0
#wum add wso2am-analytics-2.2.0
#wum add wso2is-analytics-5.5.0
#wum update wso2am-2.2.0

## Criar script de environment (meucliente-dev-env.sh)

## Criar diretório com o alias /opt/wso2/wso2apim 

## Rodar o script de instalacao
## /opt/wso2/install/wso2-install/resources/setup-apim-2.2.0-gw.sh /opt/wso2/install/meucliente-dev-env.sh
