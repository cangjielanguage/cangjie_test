// DEPENDENCE: pkgs pkga
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %n.cj pkgs.%middle pkga.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.*
import pkga.*

func main(): Int64 {
    return run()
}
func run(): Int64 {
    var a: Int32 = 3
    var b: Int32 = 4
    let data1: pkgs.Data<Int32>= pkgs.Data<Int32>(a, b)
    let data2: Int32 = pkga.Data
    var res1: Int32 = data1.area()
    if (res1 == 3 && data2 == 4){
        return 0
    }
    return 1
}

