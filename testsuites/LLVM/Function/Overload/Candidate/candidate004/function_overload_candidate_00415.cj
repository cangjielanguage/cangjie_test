// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
open class A{}
class B <: A{}

func f(a: Int32) : A{return A()}
func f(a: Int16) : B{return B()}

func main():Int64{
    let c = f(1) // EXPECTED: regex ambiguous match for function call
    return 0
}