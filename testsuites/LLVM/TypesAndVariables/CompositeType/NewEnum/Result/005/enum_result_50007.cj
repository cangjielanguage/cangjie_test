// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A <: Throwable{}

var a = 1
var b = Err<Int64>(A())



func test():Result<Int64>{
    b??a^a // calculate a^a first
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
