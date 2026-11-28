// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Branch predicates must not produce compile-time bounds errors for parameter indices.
// Out-of-bounds accesses must still throw at runtime.
// EXEC: %compiler -O0 --fno-chir-function-inlining -Woff unused %f -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %compiler %enableO2 --fno-chir-function-inlining -Woff unused %f -o %output
// EXEC: %run %run_opt %output %run_args

func read(index: Int64): Int64 {
    var row: VArray<Int64, $5> = [1, 2, 3, 4, 5]
    if (index > 6) {
        return row[index]
    }
    return row[index]
}

func write(index: Int64): Int64 {
    var row: VArray<Int64, $5> = [1, 2, 3, 4, 5]
    if (index > 6) {
        row[index] = 9
        return row[0]
    }
    row[index] = 9
    return row[index]
}

func nested(index: Int64): Int64 {
    var row: VArray<Int64, $5> = [1, 2, 3, 4, 5]
    var grid = VArray<VArray<Int64, $5>, $4>(repeat: row)
    if (index > 6) {
        return grid[1][index]
    }
    return grid[1][index]
}

func loopWrite(last: Int64): Int64 {
    var row: VArray<Int64, $5> = [1, 2, 3, 4, 5]
    var index: Int64 = 0
    while (index <= last) {
        row[index] = index
        index += 1
    }
    return row[4]
}

func localCatch(index: Int64): Int64 {
    var row: VArray<Int64, $5> = [1, 2, 3, 4, 5]
    var grid = VArray<VArray<Int64, $5>, $4>(repeat: row)
    var caught = 0
    try { row[index] } catch (_: IndexOutOfBoundsException) { caught += 1 }
    try { row[index] = 9 } catch (_: IndexOutOfBoundsException) { caught += 1 }
    try { grid[1][index] } catch (_: IndexOutOfBoundsException) { caught += 1 }
    try { row[index] += 1 } catch (_: IndexOutOfBoundsException) { caught += 1 }
    return caught
}

func loopWriteCaught(last: Int64): Bool {
    var row: VArray<Int64, $1> = [123]
    var index: Int64 = 0
    try {
        while (index <= last) {
            row[index] = index
            index += 1
        }
    } catch (_: IndexOutOfBoundsException) {
        return true
    }
    return false
}

main() {
    if (read(0) != 1 || read(4) != 5) { return 1 }
    if (write(0) != 9 || write(4) != 9) { return 2 }
    if (nested(0) != 1 || nested(4) != 5) { return 3 }
    if (loopWrite(4) != 4) { return 4 }
    if (localCatch(0) != 0 || localCatch(4) != 0) { return 5 }
    if (loopWriteCaught(0) || !loopWriteCaught(1)) { return 6 }

    var caught = 0
    for (index in [-1, 5, 7]) {
        try { read(index) } catch (_: IndexOutOfBoundsException) { caught += 1 }
        try { write(index) } catch (_: IndexOutOfBoundsException) { caught += 1 }
        try { nested(index) } catch (_: IndexOutOfBoundsException) { caught += 1 }
        caught += localCatch(index)
    }
    // The first iteration is in bounds; later iterations must retain the check.
    try { loopWrite(5) } catch (_: IndexOutOfBoundsException) { caught += 1 }
    if (caught != 22) { return 10 + caught }
    return 0
}
