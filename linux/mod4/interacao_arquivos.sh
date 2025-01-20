#!/usr/bin/env bash

# --------------------------------------VARIAVEIS
VERMELHO="\033[31;1m"
VERDE="\033[32;1m"
RESET="\033[0m"

# --------------------------------------EXECUÇÃO
grep "^m" /etc/passwd > frases_m.txt

while read -r line
do
    echo -e "${VERMELHO}FRASE: ${VERDE}${line}${RESET}"
done < "frases_m.txt"