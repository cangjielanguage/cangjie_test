// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface A<X>{
    static func foo<Y>(a:Y):Y{a}
}

interface B <: A<Int64>{}

interface C<X> <: A<Int64>{}

interface D<X> <: A<X>{}

interface E<X,Y> <: A<X>{}


func main(){
    if (A<Int64>.foo<Int64>(0)  // EXPECTED: regex function 'foo' cannot be accessed by interface name 'A'
        + B.foo<Int64>(1)   // EXPECTED: regex function 'foo' cannot be accessed by interface name 'B'
        + C<Int32>.foo<Int64>(2) // EXPECTED: regex function 'foo' cannot be accessed by interface name 'C'
        + D<Int64>.foo<Int64>(3) // EXPECTED: regex function 'foo' cannot be accessed by interface name 'D'
        + E<Int32,Int32>.foo<Int64>(4) != 10) { // EXPECTED: regex function 'foo' cannot be accessed by interface name 'E'
        return 1
    }
    return 0
}
