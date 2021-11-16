// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var b : Array<Int32> = {2}
    var r : Int32 = 2
    for (i in b) {}  = r // EXPECTED: regex illegal left value
    do {} while ((false) = r)   // EXPECTED: regex illegal left value
    while (false) {} = r // EXPECTED: regex illegal left value
    return 0
}
