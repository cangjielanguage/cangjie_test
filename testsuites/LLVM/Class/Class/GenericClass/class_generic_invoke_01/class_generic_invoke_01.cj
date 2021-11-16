// DEPENDENCE: pkgs cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs.%middle && %copycharjs pkgs
// EXEC: %compiler %cmp_opt %n.cj pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.*

func run(): Int64 {
    var i: Int32 = 4
    let data: Data<Int32> = Data<Int32>(i)
    var res: Int32 = data.count
    if (res == 4) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
