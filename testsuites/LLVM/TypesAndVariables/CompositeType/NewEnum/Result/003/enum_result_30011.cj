// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A<:Exception{}
var a : Result<Bool> = Err(A())

func test():Result<Int64>{
    a!! // EXPECTED: regex enum pattern is not matched
    return Ok<Int64>(1)
}

func main(): Int64 {
    test() ?? 0
}
