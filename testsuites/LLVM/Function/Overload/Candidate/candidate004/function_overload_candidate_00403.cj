// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface A{}
interface B{}
class C <: A &B{}

func test(a:A):Int64{1}
func test(a:B):Int64{2}

func main():Int64{
    test(C()) // EXPECTED: regex ambiguous match for function call
    return 0
}