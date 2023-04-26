#!/usr/bin/bash

g++ -std=c++11 -O1 program.cpp -o fib_O0
g++ -std=c++11 -O1 program.cpp -o fib_O1
g++ -std=c++11 -O1 program.cpp -o fib_O2
g++ -std=c++11 -O1 program.cpp -o fib_O3

echo "Вимірювання часу виконання:"
time ./fib_O0
time ./fib_O1
time ./fib_O2
time ./fib_O3

echo "Отримання переліку розширень процесору:"
lscpu | grep -E "^Flags"

extensions="SSE2 SSE3 SSE4_1 SSE4_2 AVX AVX2 AVX512"

for ext in $extensions; do
    echo "Компіляція з оптимізацією для розширення $ext:"
    icpc -x$ext -O3 -o "fib_intel_$ext" program.cpp
    echo "Вимірювання часу виконання для розширення $ext:"
    time "./fib_intel_$ext"
done
read
