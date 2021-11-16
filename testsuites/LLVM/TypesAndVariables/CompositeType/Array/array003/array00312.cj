// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-auto array init with single element must be subtype of 'List' or 'Collection'
func main(): Int64{
    var myArray = Array<Int32>(0)
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
