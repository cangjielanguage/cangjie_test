// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class C1{
    let test : Int64 = 1
    let lambda = { i: Int64 => test - i} // EXPECTED: regex 'test' is not allowed to be accessed before all member variables are initialized
}

func main(): Int64 {
    return 0
}
