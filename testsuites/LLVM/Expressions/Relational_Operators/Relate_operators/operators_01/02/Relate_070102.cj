// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex illegal compare operation

func main(): Int64 {

    let a = 9
    let b = 10
    let c = 11

    a < b <= c

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
