#2.0.0升级2.2.0 APOLLOCONFIGDB 下 添加字段：ALTER TABLE Item ADD COLUMN Type  int NOT NULL DEFAULT '0';

./scripts/build.sh
mkdir ./docker_build/apollo-adminservice/apollo-adminservice
cp ./apollo-adminservice/target/apollo-adminservice-2.2.0-github.zip ./docker_build/apollo-adminservice/apollo-adminservice/
cd docker_build/apollo-adminservice/apollo-adminservice/
unzip ./apollo-adminservice-2.2.0-github.zip 
rm -f ./apollo-adminservice-2.2.0-github.zip
cd ..
docker build . -t apollo-adminservice-dm8:2.2.0 --platform linux/arm64

cd ..
cd ..

mkdir ./docker_build/apollo-configservice/apollo-configservice
cp ./apollo-configservice/target/apollo-configservice-2.2.0-github.zip ./docker_build/apollo-configservice/apollo-configservice/
cd docker_build/apollo-configservice/apollo-configservice/
unzip ./apollo-configservice-2.2.0-github.zip 
rm -f ./apollo-configservice-2.2.0-github.zip
cd ..
docker build . -t apollo-configservice-dm8:2.2.0 --platform linux/arm64

cd ..
cd ..


mkdir ./docker_build/apollo-portal/apollo-portal
cp ./apollo-portal/target/apollo-portal-2.2.0-github.zip ./docker_build/apollo-portal/apollo-portal/
cd docker_build/apollo-portal/apollo-portal/
unzip ./apollo-portal-2.2.0-github.zip 
rm -f ./apollo-portal-2.2.0-github.zip
cd ..
docker build . -t apollo-portal-dm8:2.2.0 --platform linux/arm64

cd ..
cd ..

mkdir image-tar
cd image-tar
docker save -o ./apollo-portal-dm8.tar apollo-portal-dm8:2.2.0  
docker save -o ./apollo-configservice-dm8.tar apollo-configservice-dm8:2.2.0  
docker save -o ./apollo-adminservice-dm8.tar apollo-adminservice-dm8:2.2.0  


#docker run -p 8090:8090 \
#    -e SPRING_DATASOURCE_URL="jdbc:dm://192.168.1.175:5236?SCHEMA=APOLLOCONFIGDB" \
#    -e SPRING_DATASOURCE_USERNAME=APOLLOCONFIGDB -e SPRING_DATASOURCE_PASSWORD=APOLLOCONFIGDB \
#    -d -v /tmp/logs:/opt/logs --name apollo-adminservice apollo-adminservice-dm8:2.2.0
 
#docker run -p 8080:8080 \
#    -e SPRING_DATASOURCE_URL="jdbc:dm://192.168.1.175:5236?SCHEMA=APOLLOCONFIGDB" \
#    -e SPRING_DATASOURCE_USERNAME=APOLLOCONFIGDB -e SPRING_DATASOURCE_PASSWORD=APOLLOCONFIGDB \
#    -d -v /tmp/logs:/opt/logs --name apollo-configservice apollo-configservice-dm8:2.2.0
	
 
#docker run -p 8070:8070 \
#    -e SPRING_DATASOURCE_URL="jdbc:dm://192.168.1.175:5236?SCHEMA=APOLLOPORTALDB" \
#    -e SPRING_DATASOURCE_USERNAME=APOLLOPORTALDB -e SPRING_DATASOURCE_PASSWORD=APOLLOPORTALDB \
#    -e APOLLO_PORTAL_ENVS=dev,pro \
#    -e DEV_META=http://192.168.1.152:8080 -e PRO_META=http://192.168.1.152:8080 \
#    -d -v /tmp/logs:/opt/logs --name apollo-portal apollo-portal-dm8:2.2.0