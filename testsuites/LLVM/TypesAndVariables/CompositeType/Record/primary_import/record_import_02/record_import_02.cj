// DEPENDENCE: pkgs cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj pkgs/pkga.cj -o pkgs.%middle && %copycharjs pkgs
// EXEC: %compiler %cmp_opt %n.cj pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.Data
import pkgs.data

func main(): Int64 {
    return run()
}
func run(): Int64 {
    var res: Int32
    res = data.area()
    if (res == 3){
        return 0
    }
    return 1
}

