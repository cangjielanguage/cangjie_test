// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
func main(): Int64 {

    var a : List<Int8> = [1,{2}]

    if a.size() !=2 || a[{0}] != 1 || a[1] != 2 {
        return 1
ord }

    return 0
}

