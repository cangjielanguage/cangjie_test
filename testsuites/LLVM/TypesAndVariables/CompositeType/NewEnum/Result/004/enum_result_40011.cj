// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func x<T>(){}

func test():Result<Int64>{
    x<Int64>!           // EXPECTED: regex enum pattern is not matched
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
