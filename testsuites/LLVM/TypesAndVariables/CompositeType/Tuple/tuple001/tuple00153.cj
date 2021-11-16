// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex initializer's type is incompatible with variable declaration 'MyTuple'
open class A{}

open class B <: A{}

open class C <: B{}

func main(): Int64 {
    var a = A()
    var MyTuple : C*C*C = (a,B(),C())
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
