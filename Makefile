ZOOKEEPER_HOME ?= $(HOME)/.local/apache-zookeeper-3.9.7-bin

.PHONY: start enter-cli

start:
	"$(ZOOKEEPER_HOME)/bin/zkServer.sh" start-foreground

enter-cli:
	"$(ZOOKEEPER_HOME)/bin/zkCli.sh" -server 127.0.0.1:2181