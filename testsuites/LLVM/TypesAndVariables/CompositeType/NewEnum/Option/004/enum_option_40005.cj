// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C {
    func test(){0}
}
func main(): Int64 {
    var c = C()
    let c1 = Option<C>.Some(c)
    let r1 = c1?.test
    let res = r1 ?? {=>1}
    return res()
}
