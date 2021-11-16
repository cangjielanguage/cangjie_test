// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt %f  pkga.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*

func run(): Int64 {
    if (B<Int32>() != 2) {return 1}
    return 0
}

func main(): Int64 {
    return run()
}
