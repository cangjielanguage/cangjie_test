// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A_B<T> <: A<T>{}
interface A<T>{
    operator func !():UInt64 {return 0}
//    operator func +():UInt64 {return 0}
    operator func -():UInt64 {return 0}
    /*
    operator func ++():UInt64 {return 0}
    operator func --():UInt64 {return 0}
    */
    operator func [](b:A<T>):UInt64 {return 0}
// operator ** is illegal
    operator func *(b:A<T>):UInt64  {return 0}
    operator func /(b:A<T>):UInt64  {return 0}
    operator func %(b:A<T>):UInt64  {return 0}
// operator *& is illegal
    operator func +(b:A<T>):UInt64  {return 0}
    operator func -(b:A<T>):UInt64  {return 0}
    operator func <<(b:A<T>):UInt64 {return 0}
    operator func >>(b:A<T>):UInt64 {return 0}
    operator func <(b:A<T>):UInt64  {return 0}
    operator func <=(b:A<T>):UInt64 {return 0}
    operator func >(b:A<T>):UInt64  {return 0}
    operator func >=(b:A<T>):UInt64 {return 0}
    operator func ==(b:A<T>):UInt64 {return 0}
    operator func !=(b:A<T>):UInt64 {return 0}
    operator func &(b:A<T>):UInt64  {return 0}
    operator func ^(b:A<T>):UInt64  {return 0}
    operator func |(b:A<T>):UInt64  {return 0}
//     operator func ^^(b:A<T>):UInt64 {return 0}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<UInt64> = A_B<UInt64>()
    var b : A<UInt64> = A_B<UInt64>()
    var result : Array<(UInt64)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
