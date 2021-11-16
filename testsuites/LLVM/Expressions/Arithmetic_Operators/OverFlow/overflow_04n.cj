// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var i: Int8= 127
    var i1: Int8 = 127 + 2  // EXPECTED: regex overflow in 'Addition' calculation
    print(i1.toString())
    if (i1 == 129) {
        return 0
    }
    return 1
}
