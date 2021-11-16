// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt %f pkga.%middle   -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*

func run(): Int64 {
    var res1 = GenRec.a
    var res2 = GenRec.foo()
    if (res1 == 3 && res2 == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

