set ZK="C:\temp\apache-zookeeper-3.9.7-bin"
set CP_ZK=.;%ZK%\lib\zookeeper-3.9.7.jar;%ZK%\lib\zookeeper-jute-3.9.7.jar;%ZK%\lib\slf4j-api-2.0.13.jar;%ZK%\lib\logback-core-1.3.15.jar;%ZK%\lib\logback-classic-1.3.15.jar;%ZK%\lib\netty-handler-4.1.138.Final.jar
javac -cp %CP_ZK% *.java
java -cp %CP_ZK% -Dlogback.configurationFile=file:%ZK%\conf\logback.xml Executor localhost /mcta025/ex4 out.txt lista.bat