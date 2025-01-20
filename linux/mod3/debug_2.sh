#!/usr/bin/env bash

# Para debugar somente alguns trechos especificos de código, podemos usar
# o comando antes do bloco que gostaria de testar: set -x
# e após a última linha que gostaria de debugar, adicione set +x

# ----------------------- VARIAVEIS ---------------- #
USUARIOS="$(cat /etc/passwd | cut -d : -f 1)"
MENSAGEM_USO="
    $(basename $0) - [OPÇÕES]

        -h - Menu de ajuda
        -v - Versão
        -s - Ordenar a saída
        -m - Converte para maiúsculo
"
VERSAO="V1.0"
CHAVE_ORDENA=0
CHAVE_MAIUSCULO=0

# ----------------------- EXECUÇÃO ---------------- #
set -x
while test -n "$1"
do
    case "$1" in
        -h) echo "$MENSAGEM_USO" && exit 0                  ;;
        -v) echo "$VERSAO" && exit 0                        ;;
        -s) CHAVE_ORDENA=1                                  ;;
        -m) CHAVE_MAIUSCULO=1                               ;;
        *) echo "Opção inválida, valide o -h." && exit 1    ;;
    esac
    shift
done

[ "$CHAVE_ORDENA" -eq 1 ] && USUARIOS="$(echo "$USUARIOS" | sort)"
[ "$CHAVE_MAIUSCULO" -eq 1 ] && USUARIOS="$(echo "$USUARIOS" | tr [a-z] [A-Z])"

echo "$USUARIOS"

set +x
