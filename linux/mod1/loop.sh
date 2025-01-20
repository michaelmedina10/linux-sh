#1/usr/bin/env bash

echo "====== For 1"
for ((i = 0; i < 10; i++)); do
    echo "valor $i"
done

echo "====== For 2 (seq)"
for i in $(seq 10); do
    if [ $i -ge 9 ]; then
        echo "Achei o valor: $i"
    fi
done

echo "====== For 3 (array)"
Frutas=(
    "Laranja"
    "Ameixa"
    "Abacaxi"
    "Melancia"
)

for i in "${Frutas[@]}"; do
    [ "Laranja" = $i ] && echo "Achei a Laranja"
    # if [ "Laranja" = $i ]; then
    #     echo "Achei a Laranja"
    # fi
    # echo $i
done

echo "====== while"
contador=0
while [ $contador -lt ${#Frutas[@]} ]; do
    echo $contador
    contador=$((contador+=1))
    # contador=$((contador+1))
done