// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.o
// EXEC: %compiler %cmp_opt %f -import-config  cfg-ast pkgs.o  -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.*

class Data <: I2{
  
}


func main(): Int64 {
    Data().f()
    return (a - 3)
}
