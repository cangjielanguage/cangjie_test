// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    let a = { => 1}..{  => 10}:{  => 1} // EXPECTED: regex integer type is expected for start, stop and step in range expression
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
