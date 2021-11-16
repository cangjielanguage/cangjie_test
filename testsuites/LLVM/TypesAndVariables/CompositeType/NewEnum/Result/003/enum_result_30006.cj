// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan function's return type should be explicitly declared as enum 'Result' type when using suffix operator '!'

class A<:Exception{}
var a : Result<Int64> = Err(A())

func test(){
    a!
    return Ok<Int64>(1)
}

func main(): Int64 {
    test() ?? 0
}
