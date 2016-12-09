//
//  greedy.cpp
//  algorithm_exercise
//
//  Created by KobayashiTaishi on H28/12/09.
//
//

#include <iostream>
#include <stdio.h>
//#include <algorithm>

namespace greedy {

    const int V[6] = {1, 5, 10, 50, 100, 500};
    int C[6]; // C[0] = C_1, C[1] = C_5, ... int A;
    int A;

    void solve() {
        int ans = 0;
        for (int i = 5; i >= 0; i--) {
            int t = std::min(A / V[i], C[i]); // コインiを使う枚数
            A = A - t * V[i];
            ans += t;
        }
        printf("%d\n", ans);
    }

    int main() {
        C[5] = 2;
        C[4] = 0;
        C[3] = 3;
        C[2] = 1;
        C[1] = 2;
        C[0] = 3;
        A=620;
        solve();
        return 0;
    }
}

//int main(int argc, const char * argv[]) {
//    greedy::main();
//    std::cout << "Hello, World!\n";
//    return 0;
//}
