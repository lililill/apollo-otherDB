./scripts/build.sh 
mkdir ./docker_build/apollo-adminservice/apollo-adminservice
cp ./apollo-adminservice/target/apollo-adminservice-2.0.0-github.zip ./docker_build/apollo-adminservice/apollo-adminservice/
cd docker_build/apollo-adminservice/apollo-adminservice/
unzip ./apollo-adminservice-2.0.0-github.zip 
rm -f ./apollo-adminservice-2.0.0-github.zip
cd ..
docker build . -t apollo-adminservice-kingbase8:2.0.0

cd ..
cd ..

mkdir ./docker_build/apollo-configservice/apollo-configservice
cp ./apollo-configservice/target/apollo-configservice-2.0.0-github.zip ./docker_build/apollo-configservice/apollo-configservice/
cd docker_build/apollo-configservice/apollo-configservice/
unzip ./apollo-configservice-2.0.0-github.zip 
rm -f ./apollo-configservice-2.0.0-github.zip
cd ..
docker build . -t apollo-configservice-kingbase8:2.0.0

cd ..
cd ..


mkdir ./docker_build/apollo-portal/apollo-portal
cp ./apollo-portal/target/apollo-portal-2.0.0-github.zip ./docker_build/apollo-portal/apollo-portal/
cd docker_build/apollo-portal/apollo-portal/
unzip ./apollo-portal-2.0.0-github.zip 
rm -f ./apollo-portal-2.0.0-github.zip
cd ..
docker build . -t apollo-portal-kingbase8:2.0.0

cd ..
cd ..

mkdir image-tar
cd image-tar
docker save -o ./apollo-portal-kingbase8.tar apollo-portal-kingbase8:2.0.0  
docker save -o ./apollo-configservice-kingbase8.tar apollo-configservice-kingbase8:2.0.0  
docker save -o ./apollo-adminservice-kingbase8.tar apollo-adminservice-kingbase8:2.0.0  


#docker run -p 8090:8090 \
#    -e SPRING_DATASOURCE_URL="jdbc:kingbase8://192.168.1.170:54321/apolloconfigdb" \
#    -e SPRING_DATASOURCE_USERNAME=sa -e SPRING_DATASOURCE_PASSWORD=tomtaw \
#    -d -v /tmp/logs:/opt/logs --name apollo-adminservice apollo-adminservice-kingbase8:2.0.0
 
#docker run -p 8080:8080 \
#    -e SPRING_DATASOURCE_URL="jdbc:kingbase8://192.168.1.170:54321/apolloconfigdb" \
#    -e SPRING_DATASOURCE_USERNAME=sa -e SPRING_DATASOURCE_PASSWORD=tomtaw \
#    -d -v /tmp/logs:/opt/logs --name apollo-configservice apollo-configservice-kingbase8:2.0.0
	
 
#docker run -p 8070:8070 \
#    -e SPRING_DATASOURCE_URL="jdbc:kingbase8://192.168.1.170:54321/apolloportaldb" \
#    -e SPRING_DATASOURCE_USERNAME=sa -e SPRING_DATASOURCE_PASSWORD=tomtaw \
#    -e APOLLO_PORTAL_ENVS=dev,pro \
#    -e DEV_META=http://192.168.1.152:8080 -e PRO_META=http://192.168.1.152:8080 \
#    -d -v /tmp/logs:/opt/logs --name apollo-portal apollo-portal-kingbase8:2.0.0