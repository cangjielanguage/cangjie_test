// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



record A<T>{
    operator func !():Option<Int32> {return Option<Int32>.None}
//    operator func +():Option<Int32> {return Option<Int32>.None}
    operator func -():Option<Int32> {return Option<Int32>.None}
    /*
    operator func ++():Option<Int32> {return Option<Int32>.None}
    operator func --():Option<Int32> {return Option<Int32>.None}
    */
    operator func [](b:A<T>):Option<Int32> {return Option<Int32>.None}
// operator ** is illegal
    operator func *(b:A<T>):Option<Int32>  {return Option<Int32>.None}
    operator func /(b:A<T>):Option<Int32>  {return Option<Int32>.None}
    operator func %(b:A<T>):Option<Int32>  {return Option<Int32>.None}
// operator *& is illegal
    operator func +(b:A<T>):Option<Int32>  {return Option<Int32>.None}
    operator func -(b:A<T>):Option<Int32>  {return Option<Int32>.None}
    operator func <<(b:A<T>):Option<Int32> {return Option<Int32>.None}
    operator func >>(b:A<T>):Option<Int32> {return Option<Int32>.None}
    operator func <(b:A<T>):Option<Int32>  {return Option<Int32>.None}
    operator func <=(b:A<T>):Option<Int32> {return Option<Int32>.None}
    operator func >(b:A<T>):Option<Int32>  {return Option<Int32>.None}
    operator func >=(b:A<T>):Option<Int32> {return Option<Int32>.None}
    operator func ==(b:A<T>):Option<Int32> {return Option<Int32>.None}
    operator func !=(b:A<T>):Option<Int32> {return Option<Int32>.None}
    operator func &(b:A<T>):Option<Int32>  {return Option<Int32>.None}
    operator func ^(b:A<T>):Option<Int32>  {return Option<Int32>.None}
    operator func |(b:A<T>):Option<Int32>  {return Option<Int32>.None}
//     operator func ^^(b:A<T>):Option<Int32> {return Option<Int32>.None}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Option<Int32>> = A<Option<Int32>>()
    var b : A<Option<Int32>> = A<Option<Int32>>()
    var result : Array<(Option<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
