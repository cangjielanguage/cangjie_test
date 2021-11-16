// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



class A<T>{
    operator func !():Option<T> {return Option<T>.None}
//    operator func +():Option<T> {return Option<T>.None}
    operator func -():Option<T> {return Option<T>.None}
    /*
    operator func ++():Option<T> {return Option<T>.None}
    operator func --():Option<T> {return Option<T>.None}
    */
    operator func [](b:A<T>):Option<T> {return Option<T>.None}
// operator ** is illegal
    operator func *(b:A<T>):Option<T>  {return Option<T>.None}
    operator func /(b:A<T>):Option<T>  {return Option<T>.None}
    operator func %(b:A<T>):Option<T>  {return Option<T>.None}
// operator *& is illegal
    operator func +(b:A<T>):Option<T>  {return Option<T>.None}
    operator func -(b:A<T>):Option<T>  {return Option<T>.None}
    operator func <<(b:A<T>):Option<T> {return Option<T>.None}
    operator func >>(b:A<T>):Option<T> {return Option<T>.None}
    operator func <(b:A<T>):Option<T>  {return Option<T>.None}
    operator func <=(b:A<T>):Option<T> {return Option<T>.None}
    operator func >(b:A<T>):Option<T>  {return Option<T>.None}
    operator func >=(b:A<T>):Option<T> {return Option<T>.None}
    operator func ==(b:A<T>):Option<T> {return Option<T>.None}
    operator func !=(b:A<T>):Option<T> {return Option<T>.None}
    operator func &(b:A<T>):Option<T>  {return Option<T>.None}
    operator func ^(b:A<T>):Option<T>  {return Option<T>.None}
    operator func |(b:A<T>):Option<T>  {return Option<T>.None}
//     operator func ^^(b:A<T>):Option<T> {return Option<T>.None}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    var result : Array<(Option<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
