// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

 internal var a = 1
 external let b = a
 internal var c = 2
 external var d = c


 func main(): Int64 {

     if=(a != 1 || b != 1 || c != 2 || d != 2) {
         return 1
     }

     return 0
 }
