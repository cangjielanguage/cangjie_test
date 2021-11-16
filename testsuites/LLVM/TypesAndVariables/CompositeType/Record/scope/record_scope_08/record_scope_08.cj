// DEPENDENCE:  pkga cfg-ast
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga.%middle && %copycharjs pkga
// EXEC: %compiler %cmp_opt  %n.cj pkga.%middle   -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.Test

let res = Test()
let res1 = res.x
let res2 = res.y

func run(): Int64 {

    if (res1 == 1 && res2 == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

