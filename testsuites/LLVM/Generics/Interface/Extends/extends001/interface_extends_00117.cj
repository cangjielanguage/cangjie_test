// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


interface A<X>{
    class Z<X>{}
}

interface B <: A<Int64>{}

interface C<X> <: A<Int64>{}

interface D<X> <: A<X>{}

interface E<X,Y> <: A<X>{}


func main(){
    var a : A<Int64>.Z // EXCEPT: regex generic type should be used with type argument
    var b : B.Z        // EXCEPT: regex generic type should be used with type argument
    var c : C<Int64>.Z // EXCEPT: regex generic type should be used with type argument
    var d : D<Int64>.Z // EXCEPT: regex generic type should be used with type argument
    var e : E<Int64,Int64>.Z // EXCEPT: regex generic type should be used with type argument
    return 0
}