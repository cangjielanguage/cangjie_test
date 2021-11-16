// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
class C1{
//  init(){}
    let test : Int64 = 1
    let lambda = { i: Int64 => this.test - i}  // EXPECTED: regex 'test' is not allowed to be accessed before all member variables are initialized
}

func main(): Int64 {
    return 0
}
