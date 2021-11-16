// DEPENDENCE: ../src ../cfg-ast ../cfg2-ast
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.o
// EXEC: %compiler %cmp_opt -c src/pkgs2/pkgs2.cj -import-config cfg-ast -o pkgs2.o
// EXEC: %compiler %cmp_opt %f -import-config cfg2-ast pkgs.o pkgs2.o -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.*
import pkgs2.*


class Data <: I2{
  
}


func main(): Int64 {
    Data().f()
    return (a - 3)
}
