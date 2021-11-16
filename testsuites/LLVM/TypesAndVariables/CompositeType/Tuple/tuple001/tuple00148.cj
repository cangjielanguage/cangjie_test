// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex undeclared type name 'youtype'
type mytype = Int32

func main(): Int64 {
    var a : mytype = 1
    var MyTuple : youtype*mytype = (a,1)
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
