#!/usr/bin/env bash

# Existen várias formas de debugar um código shell
# Para códigos pequenos, podemos usar a opção: bash -x ./arquivo.sh
# No próprio terminal será mostrado passo a passo da execução e o valor das variáveis
# Caso queira além do debug visualizar o código que está sendo testado adicione a flag -v no comando bash
# bash -xv ./arquivo.sh

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
