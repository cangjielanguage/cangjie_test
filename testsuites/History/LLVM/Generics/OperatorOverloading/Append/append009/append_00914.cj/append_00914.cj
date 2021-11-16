// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record A<X>{}

trait update{
    operator func +(a:This,b:This):Bool
}

append A<Int8> with update{
    operator func +(a:A<Int8>,b:A<Int8>):Bool {false}
}

append<X> A<X> with update where X <: update{
    operator func +(a:A<X>,b:A<X>):Bool  {true}
}

func main(): Int64 {
    var a : A<A<Int8>> = A<A<Int8>>()
    var b : A<A<Int8>> = A<A<Int8>>()
    if (!(b+a)) {
        return 1
    }
    return 0
}
