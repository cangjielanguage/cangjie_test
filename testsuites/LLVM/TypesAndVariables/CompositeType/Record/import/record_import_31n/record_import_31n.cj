// DEPENDENCE: pkgs pkga cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs.%middle && %copycharjs pkgs
// EXEC: %compiler %cmp_opt -c pkga/pkga.cj -o pkga.%middle && %copycharjs pkga
// EXEC: %compiler %cmp_opt %n.cj pkgs.%middle pkga.%middle -o %output
// EXEC： %run %run_opt %output %run_args

import pkgs.Data
import pkga.Data

func main(): Int64 {
    return run()
}
func run(): Int64 {
    var res: Int32
    var a: Int32 = 3
    var b: Int32 = 4
    let data1: pkgs.Data= pkgs.Data(a, b)
    let data2: pkga.Data= pkga.Data(a, b)
    res = data1.area()
    if (res == 3){
        return 0
    }
    return 1
}

