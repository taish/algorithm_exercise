//
//  greedy_scheduling.cpp
//  algorithm_exercise
//
//  Created by KobayashiTaishi on H28/12/09.
//
//


#include <iostream>
//#include <stdio.h>

namespace greedy_scheduling {
    int task_count = 5;
    int start_times[] = {1, 2, 4, 6, 8};
    int end_times[] = {3, 5, 7, 9, 10};

    std::pair<int, int> tasks[100000];

    // アルゴリズム
    // 一番多いタスクの組み合わせ
    // 開始時間が早いものから、かぶっていないやつを選ぶ -> 1~10, 2~3,4~5があると1~10を選んでしまう。
    // 終了時間が早いもの。
    // 時間が最も短いもの->組み合わせで最適にならない
    // その仕事を選ぶときは最初から終わりまで
    void solve() {
        int count = 0;
        // pairは辞書順で比較される
        // 終了時間の早い順にしたいため、Tをfirstに、Sをsecondに入れる
        for (int i = 0; i < task_count; i++) {
            tasks[i].first = end_times[i];
            tasks[i].second = start_times[i];
        }
        sort(tasks, tasks + task_count);
        int last_time = 0;
        for (int i = 0; i < task_count; i++) {
            if (tasks[i].second > last_time) {
                last_time = tasks[i].first;
                count += 1;
            }
        }
        // ABBCBA
        // ABCBBA
        printf("%d\n", count);
    }

    int main() {
        solve();
        return 0;
    }
}

int main(int argc, const char * argv[]) {
    greedy_scheduling::main();
    std::cout << "Hello, World!\n";
    return 0;
}
