# wso2-install
Nesse repositório serão encontrados os artefatos necessários para instalar a plataforma WSO2 através de scripts. Os scripts serão baseados em cada versão de cada produto bem como poderão ser utilizados múltiplas linguagens e/ou configuration management tools, como ansible.

# Para iniciar o processo, rode os seguintes comandos no seu terminal linux CentOS 7.5

sudo yum -y install git
sudo yum -y install unzip 
sudo yum -y install telnet
sudo yum -y install wget
sudo yum -y install java-1.8.0-openjdk
sudo yum install -y mysql
sudo yum install -y docker

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
sudo su - wso2
cd /opt/wso2
tar -xvzf ./install/wso2-install/files/wum-3.0.5-linux-x64.tar.gz


Preparar um script para o ambiente desejado, por exemplo homologação, baseado nesse template: template-env-vars.sh. Esse template ainda contém algumas variáveis que parecem repetidas e precisam de uma melhor documentação, no momento em que este documento está sendo criado, porém todas as variáveis são necessárias. 
Crie esse arquivo seguindo o padrão:
/opt/wso2/install/environments
   ./dev/env-vars.sh
   ./stage/env-vars.sh
   ./prod/env-vars.sh
Como user: wso2
# edite o arquivo ( ou cole o conteúdo que foi criado localmente :-D ) 
sudo su - wso2
cdinstall
mkdir -p ../environments/stage
mkdir -p ../environments/dev
mkdir -p ../environments/prod
touch ../environments/prod/env-vars.sh
chmod 755 ../environments/prod/env-vars.sh
vi ../environments/prod/env-vars.sh

Esses diretórios são esperados pelo script. Caso queira utilizar outro padrão, será preciso alterar os scripts do projeto. 
Para cada servidor, faça download do produto desejado, assim como seus updates, antes de iniciar o procedimento de instalação. Exemplo:
Como user: wso2
# inicialize o WUM com um usuário autorizado. O exemplo a seguir diz respeito ao API-M. 
# IS: wso2is-km-5.7.0
# API-M analytics: wso2am-analytics-2.6.0
# IS Analytics: wso2is-analytics-5.7.0

wum init
wum add wso2am-2.6.0
wum update wso2am-2.6.0

# Criar o banco de dados
sudo groupadd docker
sudo usermod -aG docker wso2
sudo useradd mysql -G docker
sudo systemctl docker start
docker run -e MYSQL_ROOT_PASSWORD=rootroot -p 3306:3306 --name mysql-wso2 -d mysql:5.7
docker exec -it mysql-wso2 bash
mysql -u root -p -h localhost
