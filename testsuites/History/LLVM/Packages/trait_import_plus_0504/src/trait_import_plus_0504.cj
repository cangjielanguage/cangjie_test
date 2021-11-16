// DEPENDENCE: ../src ../cfg-asta ../cfg-ast
// EXEC: %compiler %cmp_opt %pkg_opt src/pkga/ src/pkgb/ -o ./
// EXEC: %compiler %cmp_opt %n.cj  pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*

func run(): Int64 {
    let x: Int64 = pkga.aoo()
    return x
}

func main(): Int64 {
    return run()
}
