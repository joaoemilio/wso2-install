create database wso2; 
create database wso2stat; 
create user wso2@'%' identified by 'wso2123'; 
create user wso2stat@'%' identified by 'wso2123'; 
grant all privileges on wso2.* to wso2@'%'; 
grant all privileges on wso2stat.* to wso2stat@'%';