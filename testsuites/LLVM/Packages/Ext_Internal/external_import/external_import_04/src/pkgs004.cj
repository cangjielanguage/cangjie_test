// DEPENDENCE: ../src 
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle 
// EXEC: %compiler %cmp_opt -c src/pkg2/pkg2.cj -o pkg2.%middle  
// EXEC: %compiler %cmp_opt %f   pkgs.%middle pkg2.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkg2.a

func main(): Int64 {
    return a
}
