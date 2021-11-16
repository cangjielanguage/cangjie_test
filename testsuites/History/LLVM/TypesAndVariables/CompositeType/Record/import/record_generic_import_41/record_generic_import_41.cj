// DEPENDENCE: pkgs pkga cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs/pkgs.o
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga/pkga.o
// EXEC: %compiler %cmp_opt %n.cj -import-config cfg-ast pkgs/pkgs.o pkga/pkga.o -o %output
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
    let data2: Int32 = pkga.Data<Int32>.area
    var res1: Int32 = data1.area()
    if (res1 == 3 && data2 == 4){
        return 0
    }
    return 1
}

