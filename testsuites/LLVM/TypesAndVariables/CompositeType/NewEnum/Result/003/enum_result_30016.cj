// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<:Exception{}

func test<T>(i:T):Result<T>{
    var a : Result<T> = Err(A())
    a!
    return Ok<T>(i)
}

func main(): Int64 {
    test(1) ?? 0
}
