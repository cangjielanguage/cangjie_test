// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex integer type is expected for start, stop and step in range expression

func main(): Int64 {
    let listRange = [1]..[10]:[1]
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
