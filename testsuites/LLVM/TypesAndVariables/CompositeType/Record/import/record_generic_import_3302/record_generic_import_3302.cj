// DEPENDENCE: pkgs pkga 
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %n.cj pkgs.%middle pkga.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.*
import pkga.Data

func main(): Int64 {
    return run()
}
func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    let data1: pkgs.Data= pkgs.Data(a, b)
    let data2: pkga.Data= pkga.Data(b, a)
    var res1: Int32 = data1.area()
    var res2: Int32 = data2.area()
    if (res1 == 3 && res2 == 4){
        return 0
    }
    return 1
}

