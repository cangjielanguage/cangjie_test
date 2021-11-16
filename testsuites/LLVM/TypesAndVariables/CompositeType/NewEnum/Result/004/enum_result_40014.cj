// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan enum pattern is not matched

func test():Result<Int64>{
    while (false){}!
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
