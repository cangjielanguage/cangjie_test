// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex expression of Nothing type cannot appear here currently

func test(): Result<Int64> {
    return!    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
