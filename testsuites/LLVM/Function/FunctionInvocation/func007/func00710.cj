// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

 func test(){return 0}

 func main(): Int32 {
     return test(()) // EXPECTED: regex type of return expression is incompatible with return type
 }
