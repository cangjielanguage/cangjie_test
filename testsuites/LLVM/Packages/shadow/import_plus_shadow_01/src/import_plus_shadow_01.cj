// DEPENDENCE: ../src ../cfg-asta ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o ./pkga.%middle  && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj pkga.%middle  -o ./pkgb.%middle && %copycharjs src/pkgb
// EXEC: %compiler %cmp_opt %n.cj   pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*
import pkgb.*
import pkga.aoo
import pkgb.aoo

func run(): Int64 {
    let x: Int64 = pkga.aoo()
    let y: Int64 = pkgb.aoo()
    if (x != 0){
        return 1
    }
    if (y != 0){
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
