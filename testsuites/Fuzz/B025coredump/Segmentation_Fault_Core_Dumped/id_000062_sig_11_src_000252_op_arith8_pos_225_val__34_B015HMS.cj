// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface I{}

class A <: I{}

class B <: I{}

func main(): Int64 {
    var a = A()
    var b = B()
    let myArray0 : Array<I> = @{a,b,A()[
    return 0
}
