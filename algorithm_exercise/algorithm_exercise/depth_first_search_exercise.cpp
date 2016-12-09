//
//  depth_first_search_exercise.cpp
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

// using namespace std;

namespace depth_first_search_exercise {

    int N = 10;
    int M = 12;

    char field[10][12] = {{'W', '.', '.', '.', '.', '.', '.', '.', '.', 'W', 'W', '.'},
        {'.', 'W', 'W', 'W', '.', '.', '.', '.', '.', 'W', 'W', 'W'},
        {'.', '.', '.', '.', 'W', 'W', '.', '.', '.', 'W', 'W', '.'},
        {'.', '.', '.', '.', '.', '.', '.', '.', '.', 'W', 'W', '.'},
        {'.', '.', '.', '.', '.', '.', '.', '.', '.', 'W', '.', '.'},
        {'.', '.', 'W', '.', '.', '.', '.', '.', '.', 'W', '.', '.'},
        {'.', 'W', '.', 'W', '.', '.', '.', '.', '.', 'W', 'W', '.'},
        {'W', '.', 'W', '.', 'W', '.', '.', '.', '.', '.', 'W', '.'},
        {'.', 'W', '.', 'W', '.', '.', '.', '.', '.', '.', 'W', '.'},
        {'.', '.', 'W', '.', '.', '.', '.', '.', '.', '.', 'W', '.'}};


    void dfs(int x, int y){
        //    今いるところを . に置き換える
        field[x][y] = '.';

        for(int dx = -1; dx <= 1; dx++) {
            for(int dy = -1; dy <= 1; dy++) {
                int nx = x + dx, ny = y + dy;
                if(0 <= nx && nx < N && 0 <= ny && ny < M && field[nx][ny] == 'W') {
                    dfs(nx, ny);
                    printf("%d %d\n", nx, ny);
                }
            }
        }
        return ;
    }

    void solve() {
        int res = 0;
        for(int y = 0; y < N; y++) {
            for(int x = 0; x < M; x++) {
                if (field[y][x] == 'W') {
                    dfs(y, x);

                    res++;
                }
            }
        }
        printf("%d\n", res);
    }
    
    int main() {
        solve();
        return 0;
    }
    
}
