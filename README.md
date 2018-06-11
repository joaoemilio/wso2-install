# wso2-install
Nesse repositório serão encontrados os artefatos necessários para instalar a plataforma WSO2 através de scripts. Os scripts serão baseados em cada versão de cada produto bem como poderão ser utilizados múltiplas linguagens e/ou configuration management tools, como ansible.

Diversas melhorias precisam ser desenvolvidas:
1) Implementar instalação de Cluster para Analytics
2) Implementar instalação para padrões de deployment do profile: Traffic Manager, de acordo com os artigos:
https://wso2.com/library/articles/2016/10/article-scalable-traffic-manager-deployment-patterns-for-wso2-api-manager-part-1/
https://wso2.com/library/articles/2016/10/article-scalable-traffic-manager-deployment-patterns-for-wso2-api-manager-part-2/
  2.1) Publisher
  2.2) Gateway

3) Implementar instalação em Cluster (Stateful) para o profile: Gateway
...