#!/usr/bin/env bash

# --------------------------------------VARIAVEIS ----------------------#
ARQUIVO_DE_CONFIGURACAO="$1" # Arquivo de configuração dinâmico
USAR_CORES=
USAR_MAIUSCULAS=
MENSAGEM="Mensagem de teste"

VERMELHO="\033[31;1m"
VERDE="\033[32;1m"
RESET="\033[0m"

# --------------------------------------TESTES ----------------------#
[ ! -r "$ARQUIVO_DE_CONFIGURACAO" ] && echo "Não temos acesso de leitura" && exit 1

# --------------------------------------FUNÇÕES ----------------------#
DefinirParametros(){
    local parametro="$(echo $1 | cut -d = -f 1)"
    local valor="$(echo $1 | cut -d = -f 2)"

    case $parametro in
        USAR_CORES)        USAR_CORES=$valor                    ;;
        USAR_MAIUSCULAS)   USAR_MAIUSCULAS=$valor               ;;
    esac
}


# --------------------------------------EXECUÇÃO ----------------------#
while read -r linha
do
    [ "$(echo $linha | cut -c1)" = "#" ] && continue # Ignora comentários
    [ ! $linha ] && continue # Ignora linhas em branco

    DefinirParametros "$linha"
done < "$ARQUIVO_DE_CONFIGURACAO"

[ $USAR_MAIUSCULAS -eq 1 ] && MENSAGEM="$(echo $MENSAGEM | tr [a-z] [A-Z])"
[ $USAR_CORES -eq 1 ] && MENSAGEM="$(echo -e "${VERMELHO}MSG: "${VERDE}$MENSAGEM ${RESET})"

# ----------------------------------------------------------------------#
echo "$MENSAGEM"