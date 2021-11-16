// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<:Exception{}
var a : Result<Int64> = Err(A())
var test : ()->Result<Int64> = {=>a!;return Ok<Int64>(1)}

func main(): Int64 {
    test() ?? 0
}
