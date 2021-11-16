// DEPENDENCE: ../src 
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle  && %copycharjs src/pkgs/
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.classImport04 as class04

func main(): Int64 {
    
    return class04.foo()
}
