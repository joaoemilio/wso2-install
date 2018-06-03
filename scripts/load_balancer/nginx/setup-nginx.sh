RESOURCES_HOME="/tmp/resources"
_DATAHORA=`date +"%y%m%d_%H%M%S"`

APIM_IP_ADDRESS="10.158.0.2"
GATEWAY_IP_ADDRESS="10.158.0.2"
WSO2AM_HOSTNAME="apim.minegames.com.br"
APIM_SSL_CERTIFICATE="/etc/nginx/ssl/apim.minegames.com.br.crt"
APIM_SSL_KEY="/etc/nginx/ssl/apim.minegames.com.br.key"
APIGATEWAY_URL="gateway.minegames.com.br"
GATEWAY_SSL_CERTIFICATE="/etc/nginx/ssl/gateway.minegames.com.br.crt"
GATEWAY_SSL_KEY="/etc/nginx/ssl/gateway.minegames.com.br.key"
NGINX_CONF="/etc/nginx/conf.d"

find . -type f -name *.conf | while read FILE
do
echo "atualizando arquivo $FILE"
sed -i "s,{{APIM_IP_ADDRESS}},$APIM_IP_ADDRESS,g" $FILE
sed -i "s,{{GATEWAY_IP_ADDRESS}},$GATEWAY_IP_ADDRESS,g" $FILE
sed -i "s,{{WSO2AM_HOSTNAME}},$WSO2AM_HOSTNAME,g" $FILE
sed -i "s,{{APIM_SSL_CERTIFICATE}},$APIM_SSL_CERTIFICATE,g" $FILE
sed -i "s,{{APIM_SSL_KEY}},$APIM_SSL_KEY,g" $FILE
sed -i "s,{{APIGATEWAY_URL}},$APIGATEWAY_URL,g" $FILE
sed -i "s,{{GATEWAY_SSL_CERTIFICATE}},$GATEWAY_SSL_CERTIFICATE,g" $FILE
sed -i "s,{{GATEWAY_SSL_KEY}},$GATEWAY_SSL_KEY,g" $FILE
done

cp $RESOURCES_HOME/nginx/conf.d/apim.conf $NGINX_CONF/

service nginx restart