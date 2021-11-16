// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



record A<T>{
    operator func !():Int8 {return 0}
//    operator func +():Int8 {return 0}
    operator func -():Int8 {return 0}
    /*
    operator func ++():Int8 {return 0}
    operator func --():Int8 {return 0}
    */
    operator func [](b:A<T>):Int8 {return 0}
// operator ** is illegal
    operator func *(b:A<T>):Int8  {return 0}
    operator func /(b:A<T>):Int8  {return 0}
    operator func %(b:A<T>):Int8  {return 0}
// operator *& is illegal
    operator func +(b:A<T>):Int8  {return 0}
    operator func -(b:A<T>):Int8  {return 0}
    operator func <<(b:A<T>):Int8 {return 0}
    operator func >>(b:A<T>):Int8 {return 0}
    operator func <(b:A<T>):Int8  {return 0}
    operator func <=(b:A<T>):Int8 {return 0}
    operator func >(b:A<T>):Int8  {return 0}
    operator func >=(b:A<T>):Int8 {return 0}
    operator func ==(b:A<T>):Int8 {return 0}
    operator func !=(b:A<T>):Int8 {return 0}
    operator func &(b:A<T>):Int8  {return 0}
    operator func ^(b:A<T>):Int8  {return 0}
    operator func |(b:A<T>):Int8  {return 0}
//     operator func ^^(b:A<T>):Int8 {return 0}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int8> = A<Int8>()
    var b : A<Int8> = A<Int8>()
    var result : Array<(Int8)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
