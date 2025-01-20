#!/usr/bin/env bash

NOME="Michael

Medina"

# Aspas duplas em variáveis string é uma boa prática e mantem formatação.
echo "$NOME"

NUMERO_1=10
NUMERO_2=20

# Operações matemáticas $(())
TOTAL=$((NUMERO_1 + NUMERO_2))

echo "$TOTAL"
echo "---------------------------"

echo "Removendo diretório pasta_tese caso já exista"
# 2>/dev/null é uma forma de direcionar o erro para o /dev/null para suprimir a mensagem de erro
rm -R ~/Documentos/pasta_teste 2>/dev/null

echo "Criando diretório /pasta_teste"
mkdir ~/Documentos/pasta_teste

if [ $? -eq 0 ]; then
    echo "pasta_teste criada com sucesso."
else
    echo "Erro ao criar pasta_teste"
    exit 1
fi

echo "Acessando pasta"
cd ~/Documentos/pasta_teste

echo "Criando arquivo teste.txt"
touch teste.txt

echo "Inserindo string no arquivo"
echo "Nome: Teste" > teste.txt

echo "Aplicando grep no arquivo teste.txt na palavra Nome"
# Comando sempre $(), dolar e um parenteses, usar sempre que queira capturar uma saida
# Caso contrário não há necessidade.
GREP_FILE="$(cat ~/Documentos/pasta_teste/teste.txt | grep Nome)"
echo "$GREP_FILE"

echo -e "\n---------------------------\n"
# Dessa forma fazemos a inserção de parametros
# Ao executar o script podemos passar os valores desejados
# Por exemplo ./variaveis.sh "valor_1" "valor_2"
echo "Parametro 1 $1"
echo "Parametro 2 $2"

# Mostrar todos parametros
echo "Todos Parametros $*"
echo "Quantos parametros? $#"

# 0 indica sucesso, qualquer outro valor indica erro.
echo "Última saída do comando acima: $?"

# PID: número do processo.
echo "PID: $$"

echo "Nome do script em execução $0"
