// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface D<T>{}
class C<T> <: D<T>{}
    

record A<T>{
    operator func !():D<T> {return C<T>()}
//    operator func +():D<T> {return C<T>()}
    operator func -():D<T> {return C<T>()}
    /*
    operator func ++():D<T> {return C<T>()}
    operator func --():D<T> {return C<T>()}
    */
    operator func [](b:A<T>):D<T> {return C<T>()}
// operator ** is illegal
    operator func *(b:A<T>):D<T>  {return C<T>()}
    operator func /(b:A<T>):D<T>  {return C<T>()}
    operator func %(b:A<T>):D<T>  {return C<T>()}
// operator *& is illegal
    operator func +(b:A<T>):D<T>  {return C<T>()}
    operator func -(b:A<T>):D<T>  {return C<T>()}
    operator func <<(b:A<T>):D<T> {return C<T>()}
    operator func >>(b:A<T>):D<T> {return C<T>()}
    operator func <(b:A<T>):D<T>  {return C<T>()}
    operator func <=(b:A<T>):D<T> {return C<T>()}
    operator func >(b:A<T>):D<T>  {return C<T>()}
    operator func >=(b:A<T>):D<T> {return C<T>()}
    operator func ==(b:A<T>):D<T> {return C<T>()}
    operator func !=(b:A<T>):D<T> {return C<T>()}
    operator func &(b:A<T>):D<T>  {return C<T>()}
    operator func ^(b:A<T>):D<T>  {return C<T>()}
    operator func |(b:A<T>):D<T>  {return C<T>()}
//     operator func ^^(b:A<T>):D<T> {return C<T>()}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    var result : Array<(D<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
