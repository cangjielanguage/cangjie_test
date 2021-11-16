// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex  expected function name after 'func'

func main(): Int64 {

    var uint8_var_Two: UInt8 = func
    0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
