#include <iostream>
#include <chrono>
#include <vector>

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

std::vector<int> find_primes(int count)
{
    std::vector<int> primes;
    int number = 2;

    while (primes.size() < count)
    {
        if (is_prime(number))
        {
            primes.push_back(number);
        }
        number++;
    }

    return primes;
}

int main()
{
    const int N = 1000000;

    auto start_time = std::chrono::high_resolution_clock::now();
    auto primes = find_primes(N);
    auto end_time = std::chrono::high_resolution_clock::now();

    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end_time - start_time).count();

    std::cout << "Time taken to find the first " << N << " prime numbers: " << duration << " milliseconds" << std::endl;

    return 0;
}