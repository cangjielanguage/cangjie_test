// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



class A<T>{
    operator func !():UInt32 {return 0}
//    operator func +():UInt32 {return 0}
    operator func -():UInt32 {return 0}
    /*
    operator func ++():UInt32 {return 0}
    operator func --():UInt32 {return 0}
    */
    operator func [](b:A<T>):UInt32 {return 0}
// operator ** is illegal
    operator func *(b:A<T>):UInt32  {return 0}
    operator func /(b:A<T>):UInt32  {return 0}
    operator func %(b:A<T>):UInt32  {return 0}
// operator *& is illegal
    operator func +(b:A<T>):UInt32  {return 0}
    operator func -(b:A<T>):UInt32  {return 0}
    operator func <<(b:A<T>):UInt32 {return 0}
    operator func >>(b:A<T>):UInt32 {return 0}
    operator func <(b:A<T>):UInt32  {return 0}
    operator func <=(b:A<T>):UInt32 {return 0}
    operator func >(b:A<T>):UInt32  {return 0}
    operator func >=(b:A<T>):UInt32 {return 0}
    operator func ==(b:A<T>):UInt32 {return 0}
    operator func !=(b:A<T>):UInt32 {return 0}
    operator func &(b:A<T>):UInt32  {return 0}
    operator func ^(b:A<T>):UInt32  {return 0}
    operator func |(b:A<T>):UInt32  {return 0}
//     operator func ^^(b:A<T>):UInt32 {return 0}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<UInt32> = A<UInt32>()
    var b : A<UInt32> = A<UInt32>()
    var result : Array<(UInt32)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
