// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan enum pattern is not matched

class A<:Exception{}
var a : Bool = true

func test():Result<Int64>{
    a!
    return Ok<Int64>(1)
}

func main(): Int64 {
    test() ?? 0
}
