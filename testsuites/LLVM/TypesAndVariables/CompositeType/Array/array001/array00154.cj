// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface I0{}

interface I1 <: I0{}

interface I2 <: I0{}

interface I3 <: I0{}

open class Z {}

class A <: Z & I1{}

class B <: Z & I2{}

class C <: Z & I3{}

func main(): Int64 {
    var a = A()
    var b = B()
    let myArray = @{a,b,C()} // ASSERT: scan the types 'Class-B' and 'Interface-I0' do not have their greatest subtype
    return 0
}
