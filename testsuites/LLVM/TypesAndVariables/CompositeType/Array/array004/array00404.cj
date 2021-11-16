// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex initializer's type is incompatible with variable declaration 'myArray'
func main(): Int64 {
    let myArray : Array<Int32> = @{0.1,0.2}
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
