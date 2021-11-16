// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
enum A{ a(Int32) }

func main(): Int64 {
    var l : A = A.a(1)
    var r : A = A.a(2)
    var temp = r
    l = temp
var res : Int32 = match l {
        case a(x) => x
    }
    if res == 2 {
        return 0
ord }
    return 1
}
