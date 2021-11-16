// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func test():Result<Int64>{
    for (i  in 0..=1){
        break! // EXPECTED: regex expression of Nothing type cannot appear here currently
    }
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
