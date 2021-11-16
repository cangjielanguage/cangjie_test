// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



class A<T>{
    operator func !():Float32 {return 0.0}
//    operator func +():Float32 {return 0.0}
    operator func -():Float32 {return 0.0}
    /*
    operator func ++():Float32 {return 0.0}
    operator func --():Float32 {return 0.0}
    */
    operator func [](b:A<T>):Float32 {return 0.0}
// operator ** is illegal
    operator func *(b:A<T>):Float32  {return 0.0}
    operator func /(b:A<T>):Float32  {return 0.0}
    operator func %(b:A<T>):Float32  {return 0.0}
// operator *& is illegal
    operator func +(b:A<T>):Float32  {return 0.0}
    operator func -(b:A<T>):Float32  {return 0.0}
    operator func <<(b:A<T>):Float32 {return 0.0}
    operator func >>(b:A<T>):Float32 {return 0.0}
    operator func <(b:A<T>):Float32  {return 0.0}
    operator func <=(b:A<T>):Float32 {return 0.0}
    operator func >(b:A<T>):Float32  {return 0.0}
    operator func >=(b:A<T>):Float32 {return 0.0}
    operator func ==(b:A<T>):Float32 {return 0.0}
    operator func !=(b:A<T>):Float32 {return 0.0}
    operator func &(b:A<T>):Float32  {return 0.0}
    operator func ^(b:A<T>):Float32  {return 0.0}
    operator func |(b:A<T>):Float32  {return 0.0}
//     operator func ^^(b:A<T>):Float32 {return 0.0}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Float32> = A<Float32>()
    var b : A<Float32> = A<Float32>()
    var result : Array<(Float32)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
