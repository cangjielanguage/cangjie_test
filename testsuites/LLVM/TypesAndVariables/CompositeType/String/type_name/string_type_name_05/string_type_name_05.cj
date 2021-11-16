// DEPENDENCE: pkgs cfg-ast
// EXEC: %compiler %cmp_opt -c pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %n.cj pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args 2>&1

import pkgs.string

func run(): Int64 {
    var str: String = string
    if (str == "Char Lang"){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
