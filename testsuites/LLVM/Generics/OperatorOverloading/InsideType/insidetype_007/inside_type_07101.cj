// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



record A<T>{
    operator func !():Int64 {return 0}
//    operator func +():Int64 {return 0}
    operator func -():Int64 {return 0}
    /*
    operator func ++():Int64 {return 0}
    operator func --():Int64 {return 0}
    */
    operator func [](b:A<T>):Int64 {return 0}
// operator ** is illegal
    operator func *(b:A<T>):Int64  {return 0}
    operator func /(b:A<T>):Int64  {return 0}
    operator func %(b:A<T>):Int64  {return 0}
// operator *& is illegal
    operator func +(b:A<T>):Int64  {return 0}
    operator func -(b:A<T>):Int64  {return 0}
    operator func <<(b:A<T>):Int64 {return 0}
    operator func >>(b:A<T>):Int64 {return 0}
    operator func <(b:A<T>):Int64  {return 0}
    operator func <=(b:A<T>):Int64 {return 0}
    operator func >(b:A<T>):Int64  {return 0}
    operator func >=(b:A<T>):Int64 {return 0}
    operator func ==(b:A<T>):Int64 {return 0}
    operator func !=(b:A<T>):Int64 {return 0}
    operator func &(b:A<T>):Int64  {return 0}
    operator func ^(b:A<T>):Int64  {return 0}
    operator func |(b:A<T>):Int64  {return 0}
//     operator func ^^(b:A<T>):Int64 {return 0}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int64> = A<Int64>()
    var b : A<Int64> = A<Int64>()
    var result : Array<(Int64)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
