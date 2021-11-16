// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64{
    var a = 2
    var b = 2
    a **=
    a ** = 2    // EXPECTED: regex expected expression here
    if ( a == 4) {
        return 0
    }
    return 1
}