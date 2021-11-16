// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface I1{
let test : Int64 = 1
let lambda = (i: Int64): Int64 => {this.test - i} // EXPECTED: regex-auto object cannot access static member 'test'
}

func main(): Int64 {
return 0
}
