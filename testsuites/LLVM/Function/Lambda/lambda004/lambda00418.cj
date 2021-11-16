// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

let test : Int64 = 1

interface I1{
    let lambda = { i: Int64 => this.test - i} // EXPECTED: regex-auto is not a member of
}

func main(): Int64 {
    return 1 // should compile failed
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
