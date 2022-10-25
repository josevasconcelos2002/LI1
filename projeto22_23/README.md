# Laboratórios de Informática I

## Bem-vindo

Seja bem-vindo à página inicial do gitlab do grupo 96. Aqui poderá encontrar informações tal como o número e o nome dos elementos deste grupo, como também os ficheiros atualizados que compõem o repositório do nosso trabalho.

## Repositório

O sistema de controlo de versões utilizado é o git. O repositório encontra-se disponível [nesta organização](https://gitlab.com/uminho-di/li1/2122). Para obter o repositório na sua máquina, garanta que tem a chave pública SSH adicionada na sua conta do GitLab com o email instituicional ([User Settings/SSH Keys](https://gitlab.com/-/profile/keys)), depois basta efetuar clone ao repositório.

```bash
$ git clone git@gitlab.com:uminho-di/li1/2122/2021li1g096.git
$ cd 2021li1g096 
```


Poderá também verificar os repositórios remotos criados:

```bash
$ git remote -v 
```


Antes de iniciar o seu trabalho, deve atualizar o seu repositório: 

```bash
$ git pull
```


Após fazer as alterações nos ficheiros e guardá-las, pode verificar, através do seguinte comando, que o git deteta que existem ficheiros que foram modificados localmente:

```bash
$ git status
```


Se quiser alterar o conteúdo deste ficheiros, no repositório git, deve efetuar o seguinte comando:

```bash
$ git add exemplo.hs
```


Após este passo, deve fazer o respetivo 'commit' para avisar os seus colegas que alterou o ficheiro em questão. Por exemplo:

```bash
$ git commit -m "Alterei o ficheiro.hs"
```


Por fim, para gravar esta alteração no seu grupo do gitlab, escreva este comando:

```bash
$ git push
``` 


## Testes

O projecto contém testes unitários escritos usando a biblioteca [HUnit](https://hackage.haskell.org/package/HUnit). Os testes podem ser executados da seguinte forma.

```bash
$ ghci -i="src" -i="tests" tests/Tests.hs
>>> runTestsT1  -- Correr os testes tarefa 1
>>> runTestsT2  -- Correr os testes tarefa 2
>>> runTestsT3  -- Correr os testes tarefa 3
>>> runTestsT4  -- Correr os testes tarefa 4
>>> runAllTests -- Correr todos os testes
```

## Grupo 96

- **A100763** José Pedro Torres Vasconcelos ;
- **A100898** Guilherme José Araújo Rio ;
