// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A<:Exception{}
var a : Result<Int64> = Err(A())

func test():Result<Int64>{
    return a! // EXPECTED: regex type of return expression is incompatible with return type
}

func main(): Int64 {
    test() ?? 0
}
