// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E{e(Int64)}

record A<T>{
    operator func !():E {return E.e(1)}
//    operator func +():E {return E.e(1)}
    operator func -():E {return E.e(1)}
    /*
    operator func ++():E {return E.e(1)}
    operator func --():E {return E.e(1)}
    */
    operator func [](b:A<T>):E {return E.e(1)}
// operator ** is illegal
    operator func *(b:A<T>):E  {return E.e(1)}
    operator func /(b:A<T>):E  {return E.e(1)}
    operator func %(b:A<T>):E  {return E.e(1)}
// operator *& is illegal
    operator func +(b:A<T>):E  {return E.e(1)}
    operator func -(b:A<T>):E  {return E.e(1)}
    operator func <<(b:A<T>):E {return E.e(1)}
    operator func >>(b:A<T>):E {return E.e(1)}
    operator func <(b:A<T>):E  {return E.e(1)}
    operator func <=(b:A<T>):E {return E.e(1)}
    operator func >(b:A<T>):E  {return E.e(1)}
    operator func >=(b:A<T>):E {return E.e(1)}
    operator func ==(b:A<T>):E {return E.e(1)}
    operator func !=(b:A<T>):E {return E.e(1)}
    operator func &(b:A<T>):E  {return E.e(1)}
    operator func ^(b:A<T>):E  {return E.e(1)}
    operator func |(b:A<T>):E  {return E.e(1)}
//     operator func ^^(b:A<T>):E {return E.e(1)}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<E> = A<E>()
    var b : A<E> = A<E>()
    var result : Array<(E)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
