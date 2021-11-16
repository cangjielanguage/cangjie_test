// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record C {
    var item: Int64 = 100
}
func main(): Int64 {
    var c = C()
    let c1 = Option<C>.Some(c)
    c.item = 50
    let r1 = c1?.item
    let res = r1 ?? 0
    return res - 100
}
