// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {
    var myArray : Array<Int32>
    var a = myArray[0] // EXPECTED: regex variable 'myArray' is used before initialization
    return 1
}
