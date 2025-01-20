#!/usr/bin/env bash

VAR1=""
VAR2=""

echo "Primeira forma de fazer o if"
if [[ "$VAR1" = "$VAR2" ]]; then
    echo ""São iguais
fi
echo -e "\n"

echo "Segunda forma de fazer o if, sem ; then na linha de baixo"
if [[ "$VAR1" = "$VAR2" ]]
then
    echo ""São iguais
fi
echo -e "\n"

echo "Terceira forma de fazer o if, usando palavra test"
if test "$VAR1" = "$VAR2"; then
    echo ""São iguais
fi
echo -e "\n"

echo "Quarta forma de fazer o if, somente um par de colchetes"
if [ "$VAR1" = "$VAR2" ]; then
    echo ""São iguais
fi
echo -e "\n"

echo "Quinta forma de fazer o if, forma reduzida: && == then se True executa"
[ "$VAR1" = "$VAR2" ] && echo ""São iguais
echo -e "\n"

echo "Quinta forma de fazer o if, forma reduzida: || == then se False executa"
[ "$VAR1" = "$VAR2" ] || echo ""São iguais
echo -e "\n"