// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-auto 'record' is not allowed in block, expected expression or declaration here

func main(): Int64 {
    record Test {var a : Int64}
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
