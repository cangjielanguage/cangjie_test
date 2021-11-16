// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64{
    match (10) {case case _ => 1}  // EXPECTED: regex invalid pattern in a match case
    return 0
}

