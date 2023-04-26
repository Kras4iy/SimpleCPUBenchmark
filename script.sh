#!/usr/bin/bash

echo "start - O1"

g++ -std=c++11 -O1 program.cpp -o program_O1

time for i in {1..10}
do
    ./program_O1
done

echo "start - O2"

g++ -std=c++11 -O2 program.cpp -o program_O2

time for i in {1..10}
do
    ./program_O2
done

echo "start - O3"

g++ -std=c++11 -O3 program.cpp -o program_O3

time for i in {1..10}
do
    ./program_O3
done