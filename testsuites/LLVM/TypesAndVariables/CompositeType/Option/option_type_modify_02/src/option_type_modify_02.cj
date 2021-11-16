// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %n.cj pkgs.%middle   -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.opt

func run(): Int64 {
    var res: String = match (opt) {
        case Some(x) => x
        case $None => ""
    }
    if (res == "option"){
        return 0
    }
    return 1
}

func main(): Int64{
    run()
}
