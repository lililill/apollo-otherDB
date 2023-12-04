./scripts/build.sh 
mkdir -p ./docker_build/apollo-adminservice/apollo-adminservice
cp ./apollo-adminservice/target/apollo-adminservice-2.0.0-github.zip ./docker_build/apollo-adminservice/apollo-adminservice/
cd docker_build/apollo-adminservice/apollo-adminservice/
unzip ./apollo-adminservice-2.0.0-github.zip 
rm -f ./apollo-adminservice-2.0.0-github.zip
cd ..
docker build . -t apollo-adminservice-oc2:2.0.0

cd ..
cd ..

mkdir -p  ./docker_build/apollo-configservice/apollo-configservice
cp ./apollo-configservice/target/apollo-configservice-2.0.0-github.zip ./docker_build/apollo-configservice/apollo-configservice/
cd docker_build/apollo-configservice/apollo-configservice/
unzip ./apollo-configservice-2.0.0-github.zip 
rm -f ./apollo-configservice-2.0.0-github.zip
cd ..
docker build . -t apollo-configservice-oc2:2.0.0

cd ..
cd ..


mkdir -p  ./docker_build/apollo-portal/apollo-portal
cp ./apollo-portal/target/apollo-portal-2.0.0-github.zip ./docker_build/apollo-portal/apollo-portal/
cd docker_build/apollo-portal/apollo-portal/
unzip ./apollo-portal-2.0.0-github.zip 
rm -f ./apollo-portal-2.0.0-github.zip
cd ..
docker build . -t apollo-portal-oc2:2.0.0

cd ..
cd ..

mkdir -p image-tar
cd image-tar
docker save -o ./apollo-portal-oc2.tar apollo-portal-oc2:2.0.0  
docker save -o ./apollo-configservice-oc2.tar apollo-configservice-oc2:2.0.0  
docker save -o ./apollo-adminservice-oc2.tar apollo-adminservice-oc2:2.0.0  


#docker run -p 8090:8090 \
#    -e SPRING_DATASOURCE_URL="jdbc:dm://192.168.1.175:5236?SCHEMA=APOLLOCONFIGDB" \
#    -e SPRING_DATASOURCE_USERNAME=APOLLOCONFIGDB -e SPRING_DATASOURCE_PASSWORD=APOLLOCONFIGDB \
#    -d -v /tmp/logs:/opt/logs --name apollo-adminservice apollo-adminservice-oc2:2.0.0
 
#docker run -p 8080:8080 \
#    -e SPRING_DATASOURCE_URL="jdbc:dm://192.168.1.175:5236?SCHEMA=APOLLOCONFIGDB" \
#    -e SPRING_DATASOURCE_USERNAME=APOLLOCONFIGDB -e SPRING_DATASOURCE_PASSWORD=APOLLOCONFIGDB \
#    -d -v /tmp/logs:/opt/logs --name apollo-configservice apollo-configservice-oc2:2.0.0
	
 
#docker run -p 8070:8070 \
#    -e SPRING_DATASOURCE_URL="jdbc:dm://192.168.1.175:5236?SCHEMA=APOLLOPORTALDB" \
#    -e SPRING_DATASOURCE_USERNAME=APOLLOPORTALDB -e SPRING_DATASOURCE_PASSWORD=APOLLOPORTALDB \
#    -e APOLLO_PORTAL_ENVS=dev,pro \
#    -e DEV_META=http://192.168.1.152:8080 -e PRO_META=http://192.168.1.152:8080 \
#    -d -v /tmp/logs:/opt/logs --name apollo-portal apollo-portal-oc2:2.0.0