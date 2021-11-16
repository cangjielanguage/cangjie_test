// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface D{}
    class C <: D{}
    

record A<T>{
    operator func !():D {return C()}
//    operator func +():D {return C()}
    operator func -():D {return C()}
    /*
    operator func ++():D {return C()}
    operator func --():D {return C()}
    */
    operator func [](b:A<T>):D {return C()}
// operator ** is illegal
    operator func *(b:A<T>):D  {return C()}
    operator func /(b:A<T>):D  {return C()}
    operator func %(b:A<T>):D  {return C()}
// operator *& is illegal
    operator func +(b:A<T>):D  {return C()}
    operator func -(b:A<T>):D  {return C()}
    operator func <<(b:A<T>):D {return C()}
    operator func >>(b:A<T>):D {return C()}
    operator func <(b:A<T>):D  {return C()}
    operator func <=(b:A<T>):D {return C()}
    operator func >(b:A<T>):D  {return C()}
    operator func >=(b:A<T>):D {return C()}
    operator func ==(b:A<T>):D {return C()}
    operator func !=(b:A<T>):D {return C()}
    operator func &(b:A<T>):D  {return C()}
    operator func ^(b:A<T>):D  {return C()}
    operator func |(b:A<T>):D  {return C()}
//     operator func ^^(b:A<T>):D {return C()}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<D> = A<D>()
    var b : A<D> = A<D>()
    var result : Array<(D)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
