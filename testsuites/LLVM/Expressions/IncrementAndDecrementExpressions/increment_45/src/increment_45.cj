// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt %f pkga.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*

func run(): Int64 {
    pkga.i--
    pkga.i++
    print(i.toString())
    if (i==-2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

