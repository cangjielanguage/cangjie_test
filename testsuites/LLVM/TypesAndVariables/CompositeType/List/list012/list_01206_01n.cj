// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var a:List<Int32> = [3,4]
    var b:List<Int64> = [1.4, 2.5, *a, 5, 6]        // EXPECTED: regex inconsistent element type for List literal
    if (b.size() == 6) {
        return 0
    }
    return 1
}
