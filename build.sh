./scripts/build.sh
rm -rf ./docker_build
mkdir -p ./docker_build/apollo-adminservice/apollo-adminservice
cp ./apollo-adminservice/target/apollo-adminservice-2.3.0-github.zip ./docker_build/apollo-adminservice/apollo-adminservice/
cp ./apollo-adminservice/Dockerfile ./docker_build/apollo-adminservice/
cd docker_build/apollo-adminservice/apollo-adminservice/
unzip ./apollo-adminservice-2.3.0-github.zip
rm -f ./apollo-adminservice-2.3.0-github.zip
cd ..
#docker build  . -t apollo-adminservice-kingbase8-pg:2.3.0 --platform linux/arm64
docker build  . -t apollo-adminservice-kingbase8-pg:2.3.0

cd ..
cd ..

mkdir -p ./docker_build/apollo-configservice/apollo-configservice
cp ./apollo-configservice/target/apollo-configservice-2.3.0-github.zip ./docker_build/apollo-configservice/apollo-configservice/
cp ./apollo-configservice/Dockerfile ./docker_build/apollo-configservice/
cd docker_build/apollo-configservice/apollo-configservice/
unzip ./apollo-configservice-2.3.0-github.zip
rm -f ./apollo-configservice-2.3.0-github.zip
cd ..
docker build . -t apollo-configservice-kingbase8-pg:2.3.0
#docker build . -t apollo-configservice-kingbase8-pg:2.3.0 --platform linux/arm64


cd ..
cd ..


mkdir -p ./docker_build/apollo-portal/apollo-portal
cp ./apollo-portal/target/apollo-portal-2.3.0-github.zip ./docker_build/apollo-portal/apollo-portal/
cp ./apollo-portal/Dockerfile ./docker_build/apollo-portal/

cd docker_build/apollo-portal/apollo-portal/
unzip ./apollo-portal-2.3.0-github.zip
rm -f ./apollo-portal-2.3.0-github.zip
cd ..
docker build . -t apollo-portal-kingbase8-pg:2.3.0
#docker build . -t apollo-portal-kingbase8-pg:2.3.0 --platform linux/arm64

cd ..
cd ..

rm -rf ./image-tar
mkdir image-tar
cd image-tar
docker save -o ./apollo-portal-kingbase8-pg.tar apollo-portal-kingbase8-pg:2.3.0
docker save -o ./apollo-configservice-kingbase8-pg.tar apollo-configservice-kingbase8-pg:2.3.0
docker save -o ./apollo-adminservice-kingbase8-pg.tar apollo-adminservice-kingbase8-pg:2.3.0



#docker run -p 8090:8090 \
#    -e SPRING_DATASOURCE_URL="jdbc:kingbase8://192.168.1.176:54321/apolloconfigdb" \
#    -e SPRING_DATASOURCE_USERNAME=system -e SPRING_DATASOURCE_PASSWORD=Tomtaw001 \
#    -d -v /tmp/logs:/opt/logs --name apollo-adminservice apollo-adminservice-kingbase8-pg:2.3.0
#
#docker run -p 8080:8080 \
#    -e SPRING_DATASOURCE_URL="jdbc:kingbase8://192.168.1.176:54321/apolloconfigdb" \
#    -e SPRING_DATASOURCE_USERNAME=system -e SPRING_DATASOURCE_PASSWORD=Tomtaw001 \
#    -d -v /tmp/logs:/opt/logs --name apollo-configservice apollo-configservice-kingbase8-pg:2.3.0
#
#
#docker run -p 8070:8070 \
#    -e SPRING_DATASOURCE_URL="jdbc:kingbase8://192.168.1.176:54321/apolloportaldb" \
#    -e SPRING_DATASOURCE_USERNAME=system -e SPRING_DATASOURCE_PASSWORD=Tomtaw001 \
#    -e APOLLO_PORTAL_ENVS=dev,pro \
#    -e DEV_META=http://192.168.1.152:8080 -e PRO_META=http://192.168.1.152:8080 \
#    -d -v /tmp/logs:/opt/logs --name apollo-portal apollo-portal-kingbase8-pg:2.3.0