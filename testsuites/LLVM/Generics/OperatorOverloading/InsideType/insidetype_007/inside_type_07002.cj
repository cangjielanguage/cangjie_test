// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



class A<T>{
    operator func !():UInt8 {return 0}
//    operator func +():UInt8 {return 0}
    operator func -():UInt8 {return 0}
    /*
    operator func ++():UInt8 {return 0}
    operator func --():UInt8 {return 0}
    */
    operator func [](b:A<T>):UInt8 {return 0}
// operator ** is illegal
    operator func *(b:A<T>):UInt8  {return 0}
    operator func /(b:A<T>):UInt8  {return 0}
    operator func %(b:A<T>):UInt8  {return 0}
// operator *& is illegal
    operator func +(b:A<T>):UInt8  {return 0}
    operator func -(b:A<T>):UInt8  {return 0}
    operator func <<(b:A<T>):UInt8 {return 0}
    operator func >>(b:A<T>):UInt8 {return 0}
    operator func <(b:A<T>):UInt8  {return 0}
    operator func <=(b:A<T>):UInt8 {return 0}
    operator func >(b:A<T>):UInt8  {return 0}
    operator func >=(b:A<T>):UInt8 {return 0}
    operator func ==(b:A<T>):UInt8 {return 0}
    operator func !=(b:A<T>):UInt8 {return 0}
    operator func &(b:A<T>):UInt8  {return 0}
    operator func ^(b:A<T>):UInt8  {return 0}
    operator func |(b:A<T>):UInt8  {return 0}
//     operator func ^^(b:A<T>):UInt8 {return 0}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<UInt8> = A<UInt8>()
    var b : A<UInt8> = A<UInt8>()
    var result : Array<(UInt8)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
