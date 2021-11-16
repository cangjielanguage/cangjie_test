// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
enum A{ a(Int32) }

func main(): Int64 {
    var l(1)
    var r : A =
A.a(2)
    var temp = r
in(): Int64 {
    var l : A =    l cmp_opt %f -o %ouint32 = match l {
        ca   if res == 2 {
        return 0
    }
    return 1
}
