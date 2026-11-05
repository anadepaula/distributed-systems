# Sistemas Distribuídos

**3Q2026**

**Prof. Gustavo Sousa Pavani**

*Universidade Federal do ABC (UFABC)*

## Aula Prática 3

### Roteiro de Preparação e Entrega

* Instale o ZooKeeper, versão 3.9.7, conforme indicado no Moodle.

* Crie um novo arquivo `<zookeeperDir>/conf/zoo.cfg` como mostrado em *Getting Started Guide*.

  * No Windows, considere como separador de caminhos `/` e não `\`.

* Inicialize o servidor do ZooKeeper:

  * `<zookeeperDir>/bin/zkServer.sh start-foreground` ou `<zookeeperDir>/bin/zkServer.cmd`.

  * ★ Pode ser necessário setar a variável `JAVA_HOME`.

* Baixar `Codigos.zip` e descompactar.

* Relatório em grupos de 3 ou 4 alunos, discutindo o que foi feito em aula, o qual deve ainda incluir as saídas do console.

* As atividades a seguir fazem parte do Projeto Final, a ser apresentado conforme estipulado.

### 1. Ephemeral versus Persistent (Regular) znodes

* **1.1** Inicialize a interface de comando de linha (CLI):

  `bin/zkCli.sh -server 127.0.0.1:2181` ou `bin/zkCli.cmd`.

* **1.2** Crie um znode persistente para este exercício:

  `create /mcta025 data`

* **1.3** Crie um outro znode persistente:

  `create /mcta025/ex1 data`

* **1.4** Crie um znode efêmero:

  `create -e /mcta025/ex1/ephemeral data`

* **1.5** Liste os filhos do seu sistema de arquivo (na API, `getChildren`):

  `ls <path>`

* **1.6** Saia do cliente usando o comando `quit`.

* **1.7** Reinicie a CLI e liste novamente os filhos do sistema de arquivo. O que aconteceu?

* **1.8** Crie um novo znode efêmero:

  `create -e /mcta025/ex1/ephemeral1 data`

  Então, crie um filho para o znode que acabou de ser criado:

  `create /mcta025/ex1/ephemeral1/child data`

  O que aconteceu?

### 2. Sequential suffix

* **2.1** Crie um outro znode persistente:

  `create /mcta025/ex2 data`

* **2.2** Crie znodes sequenciais (com sufixo sequencial):

  `create -s /mcta025/ex2/child data`

  Repita o comando várias vezes. Qual o comprimento do sufixo?

* **2.3** Crie znodes sequenciais efêmeros:

  `create -s -e /mcta025/ex2/child data`

  Repita o comando várias vezes.

* **2.4** Remova alguns znodes com o comando:

  `delete <path>`

* **2.5** Crie mais alguns znodes sequenciais. Como fica a numeração deles?

* **2.6** Crie znodes sequenciais com outro prefixo:

  `create -s /mcta025/ex2/son data`

  Como fica a numeração deles?

* **2.7** Crie outros znodes sequenciais em `/mcta025`. A numeração (isto é, o escopo) está relacionada com a numeração anterior?

### 3. Watches

* **3.1** Todas as operações de leitura no ZooKeeper têm a opção de se configurar um *watch*. Abra um segundo cliente em paralelo, que chamaremos de **Cliente 2**. O cliente inicial será chamado de **Cliente 1**.

  * **3.2** Crie um novo znode através do Cliente 1:

    `create /mcta025/ex3 data`

* **3.3** Configure um watch de dados do nó que acabou de ser criado no Cliente 1:

  `get -w /mcta025/ex3`

* **3.4** No Cliente 2, modifique os dados do nó:

  `set /mcta025/ex3 newData`

  O que acontece no Cliente 1?

* **3.5** Repita no Cliente 2 o comando anterior. O que aconteceu no Cliente 1? Justifique.

* **3.6** É possível instalar watch de filhos de um nó. No Cliente 1:

  `ls -w /mcta025/ex3`

  Então, no Cliente 2, crie um novo filho dentro de `/mcta025/ex3`. O que aconteceu?

* **3.7** Crie um watch de dados para `/mcta025/ex3`. No Cliente 2, crie um filho em `/mcta025/ex3`. O que aconteceu? Justifique.

* **3.8** Crie um watch de filhos para o nó `/mcta025/ex3` e um watch de filhos para um filho dele usando o Cliente 1. No Cliente 2, crie um filho no nó filho criado anteriormente. O que aconteceu? Agora crie um filho em `/mcta025/ex3`. O que podemos concluir dessas operações?

* **3.9** Crie um watch de dados de um filho de `/mcta025/ex3` e um watch de filhos para `/mcta025/ex3` no Cliente 1. No Cliente 2, remova esse nó com o comando `delete` de um filho de `/mcta025/ex3`. O que aconteceu?

### 4. ZooKeeper Java Example

* **4.1** Execute o `run.sh` depois de acertar o valor da variável `ZK` para o diretório de instalação do ZooKeeper em seu computador.

* **4.2** Em uma CLI, crie um znode:

  `create /mcta025/ex4 aData`

  O que aconteceu?

* **4.3** Depois, mude o valor do nó:

  `set /mcta025/ex4 newData`

  O que aconteceu?

* **4.4** Delete o nó:

  `delete /mcta025/ex4`

  O que aconteceu?