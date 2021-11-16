// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex inconsistent element type for array literal
interface I1{}

interface I2{}

class A <: I1{}

class B <: I2{}

func main(): Int64 {
    var a = A()
    var b = B()
    let myArray1 : Array<I1> = @{a,b}
    let myArray2 : Array<I2> = @{a,b}
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
