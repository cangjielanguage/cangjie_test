// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface I{}

open class Q{}

open class X <: Q{}

open class Y <: Q{}

open class Z <: Q{}

class A <: X & I{}

class B <: Y & I{}

class C <: Z & I{}

func main(): Int64 {
    var a = A()
    var b = B()
    let myArray = @{a,b,C()} // ASSERT: scan the types 'Class-B' and 'Interface-I' do not have their greatest subtype
    return 0
}
