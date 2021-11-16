// DEPENDENCE: pkgs 
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %n.cj pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.Data

func main(): Int64 {
    return run()
}

var Data: Int32 = 4

func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    let data1: Int32 = Data
    let data2: pkgs.Data<Int32> = pkgs.Data<Int32>(a, b)
    if (data1 == 4 && data2.area() == 3) {
        return 0
    }
    return 1
}

