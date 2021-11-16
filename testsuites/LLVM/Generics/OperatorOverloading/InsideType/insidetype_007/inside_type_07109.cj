// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



record A<T>{
    operator func !():Unit {return ()}
//        operator func +():Unit {return ()}
    operator func -():Unit {return ()}
    /*
    operator func ++():Unit {return ()}
    operator func --():Unit {return ()}
    */
    operator func [](b:A<T>):Unit {return ()}
// operator ** is illegal
    operator func *(b:A<T>):Unit  {return ()}
    operator func /(b:A<T>):Unit  {return ()}
    operator func %(b:A<T>):Unit  {return ()}
// operator *& is illegal
    operator func +(b:A<T>):Unit  {return ()}
    operator func -(b:A<T>):Unit  {return ()}
    operator func <<(b:A<T>):Unit {return ()}
    operator func >>(b:A<T>):Unit {return ()}
    operator func <(b:A<T>):Unit  {return ()}
    operator func <=(b:A<T>):Unit {return ()}
    operator func >(b:A<T>):Unit  {return ()}
    operator func >=(b:A<T>):Unit {return ()}
    operator func ==(b:A<T>):Unit {return ()}
    operator func !=(b:A<T>):Unit {return ()}
    operator func &(b:A<T>):Unit  {return ()}
    operator func ^(b:A<T>):Unit  {return ()}
    operator func |(b:A<T>):Unit  {return ()}
//     operator func ^^(b:A<T>):Unit {return ()}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Unit> = A<Unit>()
    var b : A<Unit> = A<Unit>()
    var result : Array<(Unit)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
