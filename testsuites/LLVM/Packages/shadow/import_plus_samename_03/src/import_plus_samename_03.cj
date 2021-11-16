// DEPENDENCE: ../src ../cfg-asta ../cfg-ast
// EXEC: %compiler %cmp_opt %pkg_opt -c src/pkga/ -o ./
// EXEC: %compiler %cmp_opt %n.cj   pkga.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*

func run(): Int64 {
    let v0: Int64 = 1
    let v1: String = "a"
    let x: Int64 = pkga.Data<Int64>(v0)
    let y: Int64 = pkga.Data<Int64,String>(v0,v1)
    let x2: Int64 = pkga.Data(v0)
    let y2: Int64 = pkga.Data(v0,v1)
    if (x != 1){
        return 1
    }
    if (y != 1){
        return 1
    }
    if (x2 != 2){
        return 1
    }
    if (y2 != 2){
        return 1
    }
    return 0
}

func main(): Int64 {
    return run()
}
