// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt -c src/pkgs/pkgs.cj -o pkgs.%middle
// EXEC: %compiler %cmp_opt %f   pkgs.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkgs.*

func main(): Int64 {
   var a = B().foo1()
   var b = B.b
   if ( a() != 0 || b != 0 ){
       return 1
   }
   return 0
}
