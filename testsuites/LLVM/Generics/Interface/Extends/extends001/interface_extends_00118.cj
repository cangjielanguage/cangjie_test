// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface A<X>{
    class Z<Y>{} // EXPECTED: regex class type must be toplevel
}

interface B <: A<Int64>{}

interface C<X> <: A<Int64>{}

interface D<X> <: A<X>{}

interface E<X,Y> <: A<X>{}


func main(){
    var a : A<Int64>.Z<Int64>
    var b : B.Z<Int64>
    var c : C<Int64>.Z<Int64>
    var d : D<Int64>.Z<Int64>
    var e : E<Int64,Int64>.Z<Int64>
    return 0
}
