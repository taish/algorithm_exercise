//
//  depth_first_serach.cpp
//  algorithm_exercise
//
//  Created by KobayashiTaishi on H28/12/08.
//
//

//Depth First Serach

//Yes(13 = 2 + 4 + 7)

//No

#include <stdio.h>
#include <iostream>
#include <stack>
#include <cstdio>

using namespace std;

namespace depth_first_search {

    int n = 3;
    int k = 6;
    int a[3] = {1, 2, 4};

    bool dfs(int i, int sum){
        printf("i=%d sum=%d\n", i, sum);
        if (i == n) return sum == k;

        if (dfs(i + 1, sum)) return true;

        if (dfs(i + 1, sum + a[i])) return true;

        return false;
    }

    void solve() {
        if (dfs(0, 0)) printf("Yes\n");
        else printf("No\n");
    }
    
    int main() {
        solve();
        return 0;
    }
    
}
