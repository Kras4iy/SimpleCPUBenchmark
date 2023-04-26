#include <iostream>
#include <chrono>

int main()
{
    const int n = 1000000000;
    int sum = 0;

    auto start = std::chrono::high_resolution_clock::now();

    for (int i = 1; i <= n; i++)
    {
        sum += i;
    }

    sum = 0;

    for (int i = 1; i <= n; i++)
    {
        sum += i;
    }

    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> elapsed = end - start;

    std::cout << "Sum: " << sum << std::endl;
    std::cout << "Elapsed time: " << elapsed.count() << " seconds" << std::endl;

    return 0;
}