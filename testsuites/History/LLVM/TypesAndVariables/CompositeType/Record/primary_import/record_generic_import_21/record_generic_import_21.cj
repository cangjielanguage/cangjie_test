// DEPENDENCE: pkgs cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs/pkgs.o
// EXEC: %compiler %cmp_opt %n.cj -import-config cfg-ast pkgs/pkgs.o -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.Data

func main(): Int64 {
    return run()
}

interface Data<T>{
    let i: Int32 = 3
}

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    let data1: Int32 = Data<Int32>.i
    let data2: pkgs.Data<Int32>= pkgs.Data<Int32>(a, b)
    if (data1 == 3 && data2.area() == 3) {
        return 0
    }
    return 1
}

