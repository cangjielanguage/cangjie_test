// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test():Result<Int64>{
    Ok(1)??0
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
