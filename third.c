#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <time.h>

bool is_prime(int number)
{
    if (number <= 1)
    {
        return false;
    }

    for (int i = 2; i * i <= number; i++)
    {
        if (number % i == 0)
        {
            return false;
        }
    }
    return true;
}

int *find_primes(int count)
{
    int *primes = (int *)malloc(sizeof(int) * count);
    int number = 2;
    int prime_count = 0;

    while (prime_count < count)
    {
        if (is_prime(number))
        {
            primes[prime_count++] = number;
        }
        number++;
    }

    return primes;
}

int main()
{
    const int N = 100000;

    clock_t start_time = clock();
    int *primes = find_primes(N);
    clock_t end_time = clock();

    double duration = ((double)(end_time - start_time)) / CLOCKS_PER_SEC * 1000.0;

    printf("Time taken to find the first %d prime numbers: %f milliseconds\n", N, duration);

    free(primes);

    return 0;
}
