// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func main(): Int64 {
    var lit01 = 2.10e-308   // EXPECTED: regex the number '2.10e-308' exceeds the value range of type 'Float'
    var lit02 = --1.8e308    // EXPECTED: regex expected identifier before '--'

    if (lit01 != 2.2e-308) {   // EXPECTED: regex the number '2.2e-308' exceeds the value range of type 'Float'
        return 1
    }
    if (lit02 !=-1.8e308) {   // EXPECTED: regex the number '-1.8e308' exceeds the value range of type 'Float'
        return 1
    }
    return 0
}