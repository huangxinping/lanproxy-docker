docker build -t huangxinping/lanproxy .
docker run --name lanproxy -d \
-p 4900:4900 \
-p 4993:4993 \
-p 8090:8090 \
-p 50000-50999:50000-50999 \
huangxinping/lanproxy
