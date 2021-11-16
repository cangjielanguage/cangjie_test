// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a : Float32 = 0.0
    UInt8{a}    // EXPECTED: regex expected expression or declaration here
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
