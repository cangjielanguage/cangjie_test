// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped

func main(): Int64 {
    var a = {0,1,2,3,4,5,6,7,8,9}
    let b = ..
    var res = 0
    for (i in a[b]) {
        res = res + i
    }
    if (res == 45) {
        return 0
    }
    return 1
}
