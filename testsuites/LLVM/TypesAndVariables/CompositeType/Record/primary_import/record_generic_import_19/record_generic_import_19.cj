// DEPENDENCE: pkgs cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs.%middle && %copycharjs pkgs
// EXEC: %compiler %cmp_opt %n.cj pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.Data

func main(): Int64 {
    return run()
}

class Data<T> {
    let width: T
    let length: T
    Data(width1:T, length1: T,c:Int32){
        width = length1
        length = width1
    }
    func area(): T {
        return width
    }
}

func run(): Int64 {
    var res: Int32
    var a: Int32 = 3
    var b: Int32 = 4
    let data1: Data<Int32>= Data<Int32>(a, b, b)
    let data2: pkgs.Data<Int32>= pkgs.Data<Int32>(a, b)
    if (data1.area() == 4 && data2.area() == 3) {
        return 0
    }
    return 1
}

