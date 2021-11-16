// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<:Exception{}
var a : Result<Int64> = Err(A())

func test<T>(i:T):Result<T>{
    a!
    return Ok<T>(i)
}

func main(): Int64 {
    test<Int64>(1) ?? 0
}
