// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



record A<T>{
    operator func !():Bool {return true}
//    operator func +():Bool {return true}
    operator func -():Bool {return true}
    /*
    operator func ++():Bool {return true}
    operator func --():Bool {return true}
    */
    operator func [](b:A<T>):Bool {return true}
// operator ** is illegal
    operator func *(b:A<T>):Bool  {return true}
    operator func /(b:A<T>):Bool  {return true}
    operator func %(b:A<T>):Bool  {return true}
// operator *& is illegal
    operator func +(b:A<T>):Bool  {return true}
    operator func -(b:A<T>):Bool  {return true}
    operator func <<(b:A<T>):Bool {return true}
    operator func >>(b:A<T>):Bool {return true}
    operator func <(b:A<T>):Bool  {return true}
    operator func <=(b:A<T>):Bool {return true}
    operator func >(b:A<T>):Bool  {return true}
    operator func >=(b:A<T>):Bool {return true}
    operator func ==(b:A<T>):Bool {return true}
    operator func !=(b:A<T>):Bool {return true}
    operator func &(b:A<T>):Bool  {return true}
    operator func ^(b:A<T>):Bool  {return true}
    operator func |(b:A<T>):Bool  {return true}
//     operator func ^^(b:A<T>):Bool {return true}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Bool> = A<Bool>()
    var b : A<Bool> = A<Bool>()
    var result : Array<(Bool)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
