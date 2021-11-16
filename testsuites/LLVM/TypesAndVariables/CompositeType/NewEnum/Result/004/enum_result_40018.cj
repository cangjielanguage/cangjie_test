// EXEC: %compiler %cmp_opt %f -o %output

// LLVM may not support. Only compile currently.
class A <: Throwable{}

func test():Result<Int64>{
    var a : Result<A> = Ok(A())
    throw a!
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
