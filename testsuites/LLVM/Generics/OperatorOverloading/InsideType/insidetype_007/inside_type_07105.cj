// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



record A<T>{
    operator func !():Float64 {return 0.0}
//    operator func +():Float64 {return 0.0}
    operator func -():Float64 {return 0.0}
    /*
    operator func ++():Float64 {return 0.0}
    operator func --():Float64 {return 0.0}
    */
    operator func [](b:A<T>):Float64 {return 0.0}
// operator ** is illegal
    operator func *(b:A<T>):Float64  {return 0.0}
    operator func /(b:A<T>):Float64  {return 0.0}
    operator func %(b:A<T>):Float64  {return 0.0}
// operator *& is illegal
    operator func +(b:A<T>):Float64  {return 0.0}
    operator func -(b:A<T>):Float64  {return 0.0}
    operator func <<(b:A<T>):Float64 {return 0.0}
    operator func >>(b:A<T>):Float64 {return 0.0}
    operator func <(b:A<T>):Float64  {return 0.0}
    operator func <=(b:A<T>):Float64 {return 0.0}
    operator func >(b:A<T>):Float64  {return 0.0}
    operator func >=(b:A<T>):Float64 {return 0.0}
    operator func ==(b:A<T>):Float64 {return 0.0}
    operator func !=(b:A<T>):Float64 {return 0.0}
    operator func &(b:A<T>):Float64  {return 0.0}
    operator func ^(b:A<T>):Float64  {return 0.0}
    operator func |(b:A<T>):Float64  {return 0.0}
//     operator func ^^(b:A<T>):Float64 {return 0.0}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Float64> = A<Float64>()
    var b : A<Float64> = A<Float64>()
    var result : Array<(Float64)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
