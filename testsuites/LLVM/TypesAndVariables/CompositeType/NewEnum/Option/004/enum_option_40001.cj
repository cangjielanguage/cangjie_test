// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C {
    var item: Int64 = 100
}
func main(): Int64 {
    let c = C()
    let c1 = Option<C>.Some(c)
    let r1 = c1?.item // r1 = Option<Int64>.Some(100)
    let res = r1 ?? 0
    return res - 100
}
