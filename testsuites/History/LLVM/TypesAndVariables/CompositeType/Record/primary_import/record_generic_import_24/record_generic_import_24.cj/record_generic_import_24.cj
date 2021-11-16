// DEPENDENCE: pkgs cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs/pkgs.o
// EXEC: %compiler %cmp_opt %n.cj -import-config cfg-ast pkgs/pkgs.o -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.Data

func main(): Int32 {
    return run()
}

trait Data<T> {
    func autoInc(left: This, step: T): This
}

append Int64 with Data<Int32> {
    func autoInc(left: Int64, step: Int32): Int64{
        return left + Int64(step)
    }
}

func run(): Int32 {
    var res: Int32
    var a: Int64 = 3
    var b: Int64 = 4
    let data1: Int64 = autoInc(a, b)
    let data2: pkgs.Data<Int64> = pkgs.Data<Int64>(a, b)
    if (data1 == 7 && data2.area() == 3) {
        return 0
    }
    return 1
}

