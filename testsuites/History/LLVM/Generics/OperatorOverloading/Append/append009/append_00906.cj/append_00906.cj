// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record A<X,Y>{}

trait update{
    operator func +(a:This,b:This):Bool
}

append A<Int8,Int8> with update{
    operator func +(a:A<Int8,Int8>,b:A<Int8,Int8>):Bool{true}
}

append<X> A<X,Int8> with update{
    operator func +(a:A<X,Int8>,b:A<X,Int8>):Bool{false}
}


append<X,Y> A<X,Y> with update {
    operator func +(a:A<X,Y>,b:A<X,Y>):Bool  {false}
}

func main(): Int64 {
    var a : A<Int8,Int8> = A<Int8,Int8>()
    var b : A<Int8,Int8> = A<Int8,Int8>()
    if (!(b+a)) {
        return 1
    }
    return 0
}
