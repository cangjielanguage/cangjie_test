// DEPENDENCE: ../src ../cfg-asta ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o ./pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj pkga.%middle   -o ./pkgb.%middle && %copycharjs src/pkgb
// EXEC: %compiler %cmp_opt %n.cj   pkga.%middle pkgb.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*
import pkgb.*

func coo():Int64{
    var c0: Int64 = 2
    var c1: Data_a<Int64> = Data_a<Int64> (c0,c0)
    var c: pkgb.Data_b<Int64> = pkgb.Data_b<Int64>(c0,c0,c1)
    if (c.area() != 2){
        return 1
    }
    return 0
}

func run(): Int64 {
    let x: Int64 = pkgb.boo()
    let y: Int64 = coo()
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
