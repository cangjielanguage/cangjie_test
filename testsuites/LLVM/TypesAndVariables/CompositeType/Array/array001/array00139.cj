// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex inconsistent element type for array literal
open class A{}

open class B{}

class C <: A{}

class D <: B{}

func main(): Int64 {
    var a = C()
    var b = D()
    let myArray1 : Array<A> = @{a,b}
    let myArray2 : Array<B> = @{a,b}
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
