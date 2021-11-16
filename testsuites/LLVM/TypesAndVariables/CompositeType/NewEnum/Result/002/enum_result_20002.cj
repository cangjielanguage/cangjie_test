// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<:Exception{}

func main(): Int64 {
    var a : Result<Int64> = Ok(0)
    a??1
}
