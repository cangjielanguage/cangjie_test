// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto expected expression here

func main(): Int64 {
    Int64()
    Int32()
    Int16()
    Int8()
    UInt8()
    UInt16()
    UInt32()
    UInt64()
    Float32()
    Float64()
    ord()
    chr()
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
