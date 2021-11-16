// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test():Result<Int64>{
    var a = Ok(Ok(0))
    a!!
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
