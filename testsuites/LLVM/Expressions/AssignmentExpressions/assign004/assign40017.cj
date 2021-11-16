// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var a : Unit = ()
    a++ // EXPECTED: regex 'Unit' is unsupported for this increment or decrement expression
    a-- // EXPECTED: regex 'Unit' is unsupported for this increment or decrement expression
    return 0
}
