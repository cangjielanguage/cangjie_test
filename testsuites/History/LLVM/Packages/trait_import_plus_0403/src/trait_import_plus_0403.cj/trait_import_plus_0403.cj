// DEPENDENCE: ../src ../cfg-asta ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o ./pkga.o
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj pkga.o -import-config  cfg-asta -o ./pkgb.o
// EXEC: %compiler %cmp_opt %n.cj -import-config  cfg-ast pkga.o pkgb.o -o %output
// EXEC: %run %run_opt %output %run_args

import pkgb.*

func run(): Int64 {
    let x: Int64 = pkgb.boo()
    return x
}

func main(): Int64 {
    return run()
}
