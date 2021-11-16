// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    let val = {
        var a:Bool = false
        a
        return 1;
    }
    if (val) { // EXPECTED: regex expected an expression of type 'Bool', but got
        return 1
    }
    return 0
}
