// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %run %run_opt %output %run_args

func A():Result<Int64>{Ok(1)}

func test():Result<Int64>{
    var a : ?()->Result<Int64> = A
    (a?()??Ok(1))!
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
