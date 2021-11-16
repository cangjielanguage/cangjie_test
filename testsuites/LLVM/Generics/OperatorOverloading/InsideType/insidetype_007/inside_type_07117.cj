// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



record A<T> where T<:Int32 {
    operator func !():Range<Int32> {return 0..10}
//    operator func +():Range<Int32> {return 0..10}
    operator func -():Range<Int32> {return 0..10}
    /*
    operator func ++():Range<Int32> {return 0..10}
    operator func --():Range<Int32> {return 0..10}
    */
    operator func [](b:A<T>):Range<Int32> {return 0..10}
// operator ** is illegal
    operator func *(b:A<T>):Range<Int32>  {return 0..10}
    operator func /(b:A<T>):Range<Int32>  {return 0..10}
    operator func %(b:A<T>):Range<Int32>  {return 0..10}
// operator *& is illegal
    operator func +(b:A<T>):Range<Int32>  {return 0..10}
    operator func -(b:A<T>):Range<Int32>  {return 0..10}
    operator func <<(b:A<T>):Range<Int32> {return 0..10}
    operator func >>(b:A<T>):Range<Int32> {return 0..10}
    operator func <(b:A<T>):Range<Int32>  {return 0..10}
    operator func <=(b:A<T>):Range<Int32> {return 0..10}
    operator func >(b:A<T>):Range<Int32>  {return 0..10}
    operator func >=(b:A<T>):Range<Int32> {return 0..10}
    operator func ==(b:A<T>):Range<Int32> {return 0..10}
    operator func !=(b:A<T>):Range<Int32> {return 0..10}
    operator func &(b:A<T>):Range<Int32>  {return 0..10}
    operator func ^(b:A<T>):Range<Int32>  {return 0..10}
    operator func |(b:A<T>):Range<Int32>  {return 0..10}
//     operator func ^^(b:A<T>):Range<Int32> {return 0..10}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    var result : Array<(Range<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
