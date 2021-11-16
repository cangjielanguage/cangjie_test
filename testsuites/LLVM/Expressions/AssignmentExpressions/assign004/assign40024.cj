// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface I{}
class A <: I{}

func main(): Int64 {
    var a : I = A()
    a++ // EXPECTED: regex 'Interface-I' is unsupported for this increment or decrement expression
    a-- // EXPECTED: regex 'Interface-I' is unsupported for this increment or decrement expression
    return 0
}
