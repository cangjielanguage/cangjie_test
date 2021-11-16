// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a = 1
var b = 10
var c = Ok(a..=b)

func test():Result<Int64>{
    c??a..=b
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
