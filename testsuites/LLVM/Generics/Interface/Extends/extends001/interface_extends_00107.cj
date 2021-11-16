// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A<X>{
    static func foo(a:Int64):Int64{a}
}

interface B <: A<Int64>{}

interface C<X> <: A<Int64>{}

interface D<X> <: A<X>{}

interface E<X,Y> <: A<X>{}


func main(){
    if (A<Int32>.foo(0) // EXPECTED: regex function 'foo' cannot be accessed by interface name 'A'
    + B.foo(1)  // EXPECTED: regex function 'foo' cannot be accessed by interface name 'B'
    + C<Int32>.foo(2) // EXPECTED: regex function 'foo' cannot be accessed by interface name 'C'
    + D<Int32>.foo(3) // EXPECTED: regex function 'foo' cannot be accessed by interface name 'D'
    + E<Int32,Int32>.foo(4) != 10) { // EXPECTED: regex  function 'foo' cannot be accessed by interface name 'E'
        return 1
    }
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
