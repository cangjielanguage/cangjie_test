// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



record A<T>{
    operator func !():Float16 {return 0.0}
//    operator func +():Float16 {return 0.0}
    operator func -():Float16 {return 0.0}
    /*
    operator func ++():Float16 {return 0.0}
    operator func --():Float16 {return 0.0}
    */
    operator func [](b:A<T>):Float16 {return 0.0}
// operator ** is illegal
    operator func *(b:A<T>):Float16  {return 0.0}
    operator func /(b:A<T>):Float16  {return 0.0}
    operator func %(b:A<T>):Float16  {return 0.0}
// operator *& is illegal
    operator func +(b:A<T>):Float16  {return 0.0}
    operator func -(b:A<T>):Float16  {return 0.0}
    operator func <<(b:A<T>):Float16 {return 0.0}
    operator func >>(b:A<T>):Float16 {return 0.0}
    operator func <(b:A<T>):Float16  {return 0.0}
    operator func <=(b:A<T>):Float16 {return 0.0}
    operator func >(b:A<T>):Float16  {return 0.0}
    operator func >=(b:A<T>):Float16 {return 0.0}
    operator func ==(b:A<T>):Float16 {return 0.0}
    operator func !=(b:A<T>):Float16 {return 0.0}
    operator func &(b:A<T>):Float16  {return 0.0}
    operator func ^(b:A<T>):Float16  {return 0.0}
    operator func |(b:A<T>):Float16  {return 0.0}
//     operator func ^^(b:A<T>):Float16 {return 0.0}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Float16> = A<Float16>()
    var b : A<Float16> = A<Float16>()
    var result : Array<(Float16)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
