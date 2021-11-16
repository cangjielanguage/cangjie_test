// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation


func main(): Int64{
    let a = Array<Int32>(return 5,5) // EXPECTED: regex expression of Nothing type cannot appear here currently
    return 1
}


