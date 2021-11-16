// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex expected expression or declaration here

func main(): Int64 {
    var a : Float32 = 0.0
    UInt8[a]
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
