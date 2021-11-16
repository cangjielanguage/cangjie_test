// ERRCHECK: %compiler %cmp_opt %n.cj -o %output

interface I1{}

interface I2{}

class A <: I1 & I2{}

class B <: I1 & I2{}

func main(): Int64 {
    var a = A()
    var b = B()
    let myArray = @{a,b} // EXPECTED: regex inconsistent element type for array literal
    return 0
}
