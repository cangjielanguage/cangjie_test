// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
open class C0{}

open class C1 <: C0{}

open class C2 <: C0{}

class A <: C1{}

class B <: C2{}


func main(): Int64 {
    var a = A()
    var b = B()
    let myArray = @{a,b,C1(),C2()[
    return 0
}
