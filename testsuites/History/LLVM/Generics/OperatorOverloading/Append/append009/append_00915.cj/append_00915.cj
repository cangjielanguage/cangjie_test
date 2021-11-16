// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record A<X>{}

trait update{
    operator func +(a:This,b:This):Bool
}

class B{}

append<X> A<X> with update where X <: B{
    operator func +(a:A<X>,b:A<X>):Bool  {true}
}

func main(): Int64 {
    var a : A<B> = A<B>()
    var b : A<B> = A<B>()
    if (!(b+a)) {
        return 1
    }
    return 0
}
