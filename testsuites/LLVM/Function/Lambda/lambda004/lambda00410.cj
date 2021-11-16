// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
class C1{
    init(){}
    var t : Int64 = 1
    let l : Int64 = 1
    let lambda = { i: Int64 => this.t - this.l} // EXPECTED: regex 't' is not allowed to be accessed before all member variables are initialized
}

func main(): Int64 {
    return 0
}
