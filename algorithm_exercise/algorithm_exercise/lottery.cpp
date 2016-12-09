//
//  lottery.cpp
//  algorithm_exercise
//
//  Created by KobayashiTaishi on H28/12/08.
//
//

#include <iostream>
#include <stdio.h>

namespace lottery {

    const int MAX_N = 50;

    int n,m,k[MAX_N];

    bool binary_search(int x) {
        // xの範囲 k[l]~k[r-1]
        int range_first = 0, range_last = n;

        while(range_last - range_first >= 1) {
            int index = (range_first + range_last)/2;
            if (k[index] == x) return true;
            else if (k[index] < x) range_first = index + 1;
            else range_last = index;
        }
        return false;
    }

    int main(int argn, int argm, int argk[argn]) {
        n = argn;
        m = argm;
        for (int i = 0; i < n; i++) {
            k[i] = argk[i];
        }
        // 標準入力より入力
        // 和がmになる組合せが見つかったかどうかのフラグ
        bool f = false;
        // 4重ループにより全通りの出方を試す
        for (int a = 0; a < n; a++) {
            for (int b = 0; b < n; b++) {
                for (int c = 0; c < n; c++) {
                    if (binary_search(m - k[a] - k[b] - k[c])) {
                        f = true;
                    }
                }
            }
        }

        // 標準出力へ出力
        if (f) puts("Yes"); else puts("No");

        return 0;
    }
}

//
//int fib(int n) {
//    if (n <= 1) return n;
//    return fib(n - 1) + fib(n - 2);
//}

//int main(int argc, const char * argv[]) {
//    int a[] = {1,3,5};
//    lottery::main(3, 10, a);
//    std::cout << "Hello, World!\n";
//    return 0;
//}
