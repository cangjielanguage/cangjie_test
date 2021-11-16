// DEPENDENCE: ../src ../cfg-asta ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o ./pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj pkga.%middle  -o ./pkgb.%middle && %copycharjs src/pkgb
// EXEC: %compiler %cmp_opt %n.cj   pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgb.*

func run(): Int64 {
    let x: Int64 = 0
    return x
}

func main(): Int64 {
    return run()
}
