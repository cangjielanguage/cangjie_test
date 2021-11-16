// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C{}
class A_B<T> <: A<T>{}
interface A<T>{
    operator func !():C {return C()}
//    operator func +():C {return C()}
    operator func -():C {return C()}
    /*
    operator func ++():C {return C()}
    operator func --():C {return C()}
    */
    operator func [](b:A<T>):C {return C()}
// operator ** is illegal
    operator func *(b:A<T>):C  {return C()}
    operator func /(b:A<T>):C  {return C()}
    operator func %(b:A<T>):C  {return C()}
// operator *& is illegal
    operator func +(b:A<T>):C  {return C()}
    operator func -(b:A<T>):C  {return C()}
    operator func <<(b:A<T>):C {return C()}
    operator func >>(b:A<T>):C {return C()}
    operator func <(b:A<T>):C  {return C()}
    operator func <=(b:A<T>):C {return C()}
    operator func >(b:A<T>):C  {return C()}
    operator func >=(b:A<T>):C {return C()}
    operator func ==(b:A<T>):C {return C()}
    operator func !=(b:A<T>):C {return C()}
    operator func &(b:A<T>):C  {return C()}
    operator func ^(b:A<T>):C  {return C()}
    operator func |(b:A<T>):C  {return C()}
//     operator func ^^(b:A<T>):C {return C()}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<C> = A_B<C>()
    var b : A<C> = A_B<C>()
    var result : Array<(C)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
