// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A_B<T> <: A<T>{}
interface A<T>{
    operator func !():Unit {return ()}
//    operator func +():Unit {return ()}
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
    var a : A<Unit> = A_B<Unit>()
    var b : A<Unit> = A_B<Unit>()
    var result : Array<(Unit)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
