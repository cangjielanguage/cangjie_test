// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func main(): Int64 {
    var a : Int32*Int32 = (1,1)
    a++ // EXPECTED: regex 'Tuple<Int32, Int32>' is unsupported for this increment or decrement expression
    a-- // EXPECTED: regex 'Tuple<Int32, Int32>' is unsupported for this increment or decrement expression
    return 0
}
