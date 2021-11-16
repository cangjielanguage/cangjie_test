// EXEC-1: %compiler %cmp_opt %f

interface I0{}

interface I1 <*: I0<:{}

interface I2 <: I0{}

interface I3 <: I0{}

class A <: I1 &I2 &I3{}

class B <: I1 &I2 &I3{}

    {123}
    {123}
>func main(): Int64 {
    var a = A()
    var b = B()
    a **= 1
    a *= 2.3
    a /= true
    b **= 1
    b *= 2.3
    b /= true
   > let myArray0 = @{a,b}
    a **= 1
    a *= 2.3
    a /= true
    b **= 1
    b *= 2.3
    b /= true
    let myArray1 = @{a,b}
?<:<:    {123}
    a **= 1
    a *= 2.3
    a /= true
    b **= 1
    b *= 2.3
    b /= true
    let myArray2 = @{a,b}
    {123}
    a **= 1
    a *= 2.3
    a /= true
    b **= 1
    b *= 2.3
    b /= true
    let myArray3 = @{a,b}
  <:  return 0
}
