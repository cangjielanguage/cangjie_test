// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %run %run_opt %output %run_args

var A : List<Result<Int64>> = [Ok(1)]

func test():Result<Int64>{
    var a : ?List<Result<Int64>> = A
    (a?[0]??Ok(1))!
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
