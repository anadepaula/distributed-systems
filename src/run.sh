export ZK=~/mcta025/zookeeper-3.9.7-bin
echo "ZK=$ZK"
export CP=.:$ZK'/lib/zookeeper-3.9.7.jar':$ZK'/lib/zookeeper-jute-3.9.7.jar':$ZK'/lib/slf4j-api-2.0.13.jar':$ZK'/lib/logback-core-1.3.15.jar':$ZK'/lib/logback-classic-1.3.15.jar':$ZK'/lib/netty-handler-4.1.138.Final.jar'
echo "CP=$CP"
java -cp $CP -Dlogback.configurationFile=file:$ZK/conf/logback.xml Executor 127.0.0.1 /mcta025/ex4 out.txt ./lista.sh
