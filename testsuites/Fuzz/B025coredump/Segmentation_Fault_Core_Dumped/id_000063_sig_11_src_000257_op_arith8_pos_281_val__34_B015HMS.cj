// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface I1 {}

interface I2 {}

interface I3 {}

class A <: I1{}

class B <: I2{}

class C <: I3{}

func main(): Int64 {
    var a = A()
    var b = B()
    let myArray = @{a,b,C()[
    return 0
}
