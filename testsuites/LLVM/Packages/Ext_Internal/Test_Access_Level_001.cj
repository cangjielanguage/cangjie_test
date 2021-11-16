 // EXEC: %compiler %cmp_opt %f -o %output
 // EXEC: %run %run_opt %output %run_args

 internal var a = 1
 external let b = a
 internal var c = 2
 external var d = c


 func main(): Int64 {

     if (a != 1 || b != 1 || c != 2 || d != 2) {
         return 1
     }

     return 0
 }
