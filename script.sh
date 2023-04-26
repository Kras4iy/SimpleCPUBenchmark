#!/usr/bin/bash

echo "O1"

g++ -std=c++11 -O1 program.cpp -o program_O1

time for i in {1..10}
do
    ./program_O1
done
