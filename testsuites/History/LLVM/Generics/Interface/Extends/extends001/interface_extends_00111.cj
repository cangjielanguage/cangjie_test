// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
interface A<X>{
    let a : Int64 = 2
}

interface B <: A<Int64>{}

interface C<X> <: A<Int64>{}

interface D<X> <: A<X>{}

interface E<X,Y> <: A<X>{}


func main(){
    if A<Int64>.a
     + B.a //EXPECTED: regex 'a' is not a member of interface 'B'
     + C<Int32>.a
     + D<Int64>.a
     + E<Int32,Int32>.a != 10 {

        return 1
    }
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace