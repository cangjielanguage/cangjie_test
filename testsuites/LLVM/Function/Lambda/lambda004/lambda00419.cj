// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex 'test' is not a member of class 'C1'

let test : Int64 = 1

class C1{
    let lambda = { i: Int64 => this.test - i}
}

func main(): Int64 {
    return 1
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
