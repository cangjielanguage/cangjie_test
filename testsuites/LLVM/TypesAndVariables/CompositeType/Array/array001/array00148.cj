// ERRCHECK: %compiler %cmp_opt %n.cj -o %output

interface I{}

open class Z {}

class A <: Z & I{}

class B <: Z & I{}

class C <: Z & I{}

func main(): Int64 {
    var a = A()
    var b = B()
    let myArray = @{a,b,C()} // EXPECTED: regex inconsistent element type for array literal
    return 0
}
