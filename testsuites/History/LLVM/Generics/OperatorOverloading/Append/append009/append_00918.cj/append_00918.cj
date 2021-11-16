// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<X>{}

trait update{
    operator func +(a:This,b:This):Bool
}

append B<C> with update{
    operator func +(a:B<C>,b:B<C>):Bool {true}
}


open class B<T> where T <: update{}

class C <: B<C>{}

append<X> A<X> with update where X <: B<X>{
    operator func +(a:A<X>,b:A<X>):Bool {true}
}

func main(): Int64 {
    var a : A<C> = A<C>()
    var b : A<C> = A<C>()
    if (!(b+a)) {
        return 1
    }
    return 0
}
