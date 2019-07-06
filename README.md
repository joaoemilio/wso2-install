# wso2-install
Nesse repositório serão encontrados os artefatos necessários para instalar a plataforma WSO2 através de scripts. Os scripts serão baseados em cada versão de cada produto bem como poderão ser utilizados múltiplas linguagens e/ou configuration management tools, como ansible.

# Para iniciar o processo, rode os seguintes comandos no seu terminal linux CentOS 7.5

sudo yum -y install git
sudo yum -y install unzip 
sudo yum -y install telnet
sudo yum -y install wget
sudo yum -y install java-1.8.0-openjdk
sudo useradd wso2
cd /opt
sudo mkdir wso2
sudo chown wso2:wso2 wso2
sudo su - wso2
cd /opt/wso2 
mkdir -p install/environments/prod
touch install/environments/prod/env-vars.sh
chmod 755 install/environments/prod/env-vars.sh
cd install
git clone https://github.com/joaoemilio/wso2-install.git
exit
cd /opt/


Diversas melhorias precisam ser desenvolvidas:
1) Implementar instalação de Cluster para Analytics
2) Implementar instalação para padrões de deployment do profile: Traffic Manager, de acordo com os artigos:
https://wso2.com/library/articles/2016/10/article-scalable-traffic-manager-deployment-patterns-for-wso2-api-manager-part-1/
https://wso2.com/library/articles/2016/10/article-scalable-traffic-manager-deployment-patterns-for-wso2-api-manager-part-2/
  2.1) Publisher
  2.2) Gateway

3) Implementar instalação em Cluster (Stateful) para o profile: Gateway
...