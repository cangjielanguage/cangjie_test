// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

interface A<X>{
    static func foo(a:X): X { a }
}

interface B <: A<Int64> {}

interface C<X> <: A<Int64> {}

interface D<X> <: A<X> {}

interface E<X,Y> <: A<X> {}

func main(){
    // E<Int32,Int32> return type is Int32, not match.
    if (A<Int64>.foo(0) + B.foo(1) + C<Int32>.foo(2) + D<Int64>.foo(3) + E<Int32,Int32>.foo(4) != 10) { // EXPECTED: regex invalid binary operator '\+' on type 'Int64' and 'Int32'
        return 1
    }
    return 0
}
