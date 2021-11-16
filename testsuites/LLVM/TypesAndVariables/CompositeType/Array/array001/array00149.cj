// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface I1 {}

interface I2 {}

interface I3 {}

class A <: I1{}

class B <: I2{}

class C <: I3{}

func main(): Int64 {
    var a = A()
    var b = B()
    let myArray = @{a,b,C()} // EXPECT: regex auto the type of this 'array literal's elements' is 'Object', please explicitly annotate the type or fix the code
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace