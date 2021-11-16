// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan 'return' is not in funcbody

class A<:Exception{}
var a : Result<Bool> = Err(A())
var x = a!

func main(): Int64 {
    0
}
