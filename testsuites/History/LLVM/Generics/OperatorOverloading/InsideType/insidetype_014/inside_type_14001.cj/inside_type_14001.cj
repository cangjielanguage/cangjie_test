// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait update{func test(a:This):Unit}

append Int32 with update{func test(a:Int32){}}

class A<T> where T <: update{
    operator func *(a:A<T>,b:A<T>):Bool  {true}
}

record B<T> where T <: update{
    operator func *(a:B<T>,b:B<T>):Bool  {true}
}

interface C<T> where T <: update{
    operator func *(a:C<T>,b:C<T>):Bool  {true}
}

external class D<T> <: C<T> where T <: update {}

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : B<Int32> = B<Int32>()
    var c : C<Int32> = D<Int32>()
    if (!(a*a)) {
        return 1
    }
    if (!(b*b)) {
        return 2
    }
    if (!(c*c)) {
        return 3
    }
    return 0
}
