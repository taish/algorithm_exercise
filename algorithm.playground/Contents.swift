//: Playground - noun: a place where people can play
import UIKit

// timer
func evaluateProblem<T>(problemNumber: Int, problemBlock: () -> T) -> T {
    print("Evaluating problem \(problemNumber)")

    let start = DispatchTime.now() // <<<<<<<<<< Start time
    let myGuess = problemBlock()
    let end = DispatchTime.now()   // <<<<<<<<<<   end time

    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
    let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests

    print("Time to evaluate problem \(problemNumber): \(timeInterval) seconds")
    return myGuess
}

//DP
// ナップサック問題
class Knapsack {
    struct Pair {
        // weight
        var w: Int
        // value
        var v: Int
    }
    let pairs: [Pair]
    // 個数
    var n: Int
    // 重さの総和
    var W: Int

    init() {
        pairs = [
            Pair.init(w: 2, v: 3),
            Pair.init(w: 1, v: 2),
            Pair.init(w: 3, v: 4),
            Pair.init(w: 2, v: 2)
        ]
        // 個数
        n  = 4
        // 重さの総和
        W = 5
        //　memo init
        for num in 0...(n-1) {
            memo[num] = [:]
        }
    }

    func solve() {
        print(self.rec(i: 0, j: W, sum: 0))
    }

    var memo =  [Int : [Int : Int]]()

    // i番目以降の重さの総和がj以下の最大価値
    func rec(i: Int, j: Int) -> Int {
        if memo[i]?[j] != nil {
            return (memo[i]?[j])!
        }
        var res: Int
        if (i == n) {
            // 残ってない
            res = 0
        } else if (j < pairs[i].w) {
            // この品物は入らない
            res = rec(i: i + 1, j: j)
        } else {
            // 入れない場合と入れる場合を両方試す
            let left = self.rec(i: i + 1, j: j)
            let right = self.rec(i: i + 1, j: j - pairs[i].w) + pairs[i].v
            res = max(left, right)
        }
        memo[i]?[j] = res
        return res
    }

    func rec(i: Int, j: Int, sum: Int) -> Int {
        var res: Int
        if memo[i]?[j] != nil {
            return (memo[i]?[j])!
        }
        if (i == n) {
            // 残ってない
            res = sum
        } else if (j < pairs[i].w) {
            // この品物は入らない
            res = rec(i: i + 1, j: j, sum: sum)
        } else {
            // 入れない場合と入れる場合を両方試す
            let left = self.rec(i: i + 1, j: j, sum: sum)
            let right = self.rec(i: i + 1, j: j - pairs[i].w, sum: sum + pairs[i].v)
            res = max(left, right)
        }
        memo[i]?[j] = res
        return res
    }

    func fib(n: Int) -> Int {
        if (n <= 1) { return n }
        return fib(n: n-1) + fib(n: n-2)
    }
}


class Heap {
    var heap = Array<Int>()

    func push(x: Int) {
        var index = heap.count
        print(index)
        while(index > 0) {
            let parentIndex = (index - 1) / 2
            if heap[parentIndex] <= x { break }
            // switch parent node
            if heap.indices ~= index {
//                let tmp = heap[index]
                heap[index] = heap[parentIndex]
//                heap[parentIndex] = tmp
            } else {
                heap.append(heap[parentIndex])
//                heap[parentIndex] = x
            }
            index = parentIndex
        }
        heap[index] = x
    }

    func pop() -> Int {
        let ret = heap.removeFirst()
        let topNode = heap[heap.count-1]
        heap.insert(topNode, at: 0)
        heap.removeLast()
        var index = 0
        while (index * 2 + 1 < heap.count) {
            let left = index * 2 + 1
            let right = index * 2 + 2
            let minIndex: Int
            if (right < heap.count && heap[right] < heap[left]) {
                minIndex = right
            } else {
                minIndex = left
            }
            if (heap[minIndex] >= topNode) { break }
            // change
            let tmp = heap[index]
            heap[index] = heap[minIndex]
            heap[minIndex] = tmp
            index = minIndex
        }
        return ret
    }

    init() {
        heap = [1,2,4,7,8,5]
    }

    func solve() {
//        self.push(x: 3)
        print(self.pop())
        print(heap)
        print(heap == [2,5,4,7,8])
    }
}
