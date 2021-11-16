// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f  pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.*

func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = pkgs.Foo()
    if (res == 3){
        return 0
    }
    return 1
}



