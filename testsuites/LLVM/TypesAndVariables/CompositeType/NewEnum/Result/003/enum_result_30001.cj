// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan type of return expression is incompatible with return type
class A<:Exception{}

func main(): Int64 {
    var a : Result<Int64> = Err(A())
    a!
    return 0
}
