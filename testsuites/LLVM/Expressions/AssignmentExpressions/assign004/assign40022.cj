// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum A{a(Int32)}

func main(): Int64 {
    var a : A = A.a(1)
    a++ // EXPECTED: regex 'Enum-A' is unsupported for this increment or decrement expression
    a-- // EXPECTED: regex 'Enum-A' is unsupported for this increment or decrement expression
    return 0
}
