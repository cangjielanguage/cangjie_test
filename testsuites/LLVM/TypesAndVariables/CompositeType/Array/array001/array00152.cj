// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface I0{}

interface I1{}

open class Z {}

class A <: Z & I0 & I1{}

class B <: Z & I0 & I1{}

class C <: Z & I0 & I1{}

func main(): Int64 {
    var a = A()
    var b = B()
    let myArray = @{a,b,C()} // EXPECTED: regex inconsistent element type for array literal
    return 0
}
