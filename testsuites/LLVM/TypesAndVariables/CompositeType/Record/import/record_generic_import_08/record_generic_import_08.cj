// DEPENDENCE: pkgs cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs.%middle && %copycharjs pkgs
// EXEC: %compiler %cmp_opt %n.cj pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args


import pkgs.*

func main(): Int64 {
    return run()
}
func run(): Int64 {
    var res: Int32
    var a: Int32 = 3
    var b: Int32 = 4
    let data: pkgs.Data<Int32>= pkgs.Data<Int32>(a, b)
    res = data.area()
    if (res == 3){
        return 0
    }
    return 1
}

