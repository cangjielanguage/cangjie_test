// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record B<T>{}
class A_B<T> <: A<T>{}
interface A<T>{
    operator func !():B<Int32> {return B<Int32>()}
//    operator func +():B<Int32> {return B<Int32>()}
    operator func -():B<Int32> {return B<Int32>()}
    /*
    operator func ++():B<Int32> {return B<Int32>()}
    operator func --():B<Int32> {return B<Int32>()}
    */
    operator func [](b:A<T>):B<Int32> {return B<Int32>()}
// operator ** is illegal
    operator func *(b:A<T>):B<Int32>  {return B<Int32>()}
    operator func /(b:A<T>):B<Int32>  {return B<Int32>()}
    operator func %(b:A<T>):B<Int32>  {return B<Int32>()}
// operator *& is illegal
    operator func +(b:A<T>):B<Int32>  {return B<Int32>()}
    operator func -(b:A<T>):B<Int32>  {return B<Int32>()}
    operator func <<(b:A<T>):B<Int32> {return B<Int32>()}
    operator func >>(b:A<T>):B<Int32> {return B<Int32>()}
    operator func <(b:A<T>):B<Int32>  {return B<Int32>()}
    operator func <=(b:A<T>):B<Int32> {return B<Int32>()}
    operator func >(b:A<T>):B<Int32>  {return B<Int32>()}
    operator func >=(b:A<T>):B<Int32> {return B<Int32>()}
    operator func ==(b:A<T>):B<Int32> {return B<Int32>()}
    operator func !=(b:A<T>):B<Int32> {return B<Int32>()}
    operator func &(b:A<T>):B<Int32>  {return B<Int32>()}
    operator func ^(b:A<T>):B<Int32>  {return B<Int32>()}
    operator func |(b:A<T>):B<Int32>  {return B<Int32>()}
//     operator func ^^(b:A<T>):B<Int32> {return B<Int32>()}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<B<Int32>> = A_B<B<Int32>>()
    var b : A<B<Int32>> = A_B<B<Int32>>()
    var result : Array<(B<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
