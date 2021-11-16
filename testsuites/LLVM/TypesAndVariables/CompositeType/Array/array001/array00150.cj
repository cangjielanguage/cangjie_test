// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I{}

interface I0{}

interface I1 <: I0 & I{}

interface I2 <: I0 & I{}

interface I3 <: I0 & I{}


class A <: I1{}

class B <: I2{}

class C <: I3{}

func main(): Int64 {
    var a = A()
    var b = B()
    let myArray = @{a,b,C()} // ASSERT: scan do not have their greatest subtype
    return 0
}
