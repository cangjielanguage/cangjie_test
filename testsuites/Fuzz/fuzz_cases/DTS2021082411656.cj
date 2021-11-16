// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class C {
_args

class C {
    var item: Int64 = 100
}
func main(): Int64 {
    var c = C()
    let c1 = Option<C>.Some(c)
    c.item = 50
    let r1 = c1?.item
    let res = r1 ?? 0 50
}