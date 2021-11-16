// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f  pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.test

type test = Int32*Int32

func run(): Int64 {
    if (pkgs.test == 4){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
