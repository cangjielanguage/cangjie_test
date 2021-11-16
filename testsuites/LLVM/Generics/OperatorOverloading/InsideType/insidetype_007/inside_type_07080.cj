// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C<T>{}
class A_B<T> <: A<T>{}
interface A<T>{
    operator func !():C<Int32> {return C<Int32>()}
//    operator func +():C<Int32> {return C<Int32>()}
    operator func -():C<Int32> {return C<Int32>()}
    /*
    operator func ++():C<Int32> {return C<Int32>()}
    operator func --():C<Int32> {return C<Int32>()}
    */
    operator func [](b:A<T>):C<Int32> {return C<Int32>()}
// operator ** is illegal
    operator func *(b:A<T>):C<Int32>  {return C<Int32>()}
    operator func /(b:A<T>):C<Int32>  {return C<Int32>()}
    operator func %(b:A<T>):C<Int32>  {return C<Int32>()}
// operator *& is illegal
    operator func +(b:A<T>):C<Int32>  {return C<Int32>()}
    operator func -(b:A<T>):C<Int32>  {return C<Int32>()}
    operator func <<(b:A<T>):C<Int32> {return C<Int32>()}
    operator func >>(b:A<T>):C<Int32> {return C<Int32>()}
    operator func <(b:A<T>):C<Int32>  {return C<Int32>()}
    operator func <=(b:A<T>):C<Int32> {return C<Int32>()}
    operator func >(b:A<T>):C<Int32>  {return C<Int32>()}
    operator func >=(b:A<T>):C<Int32> {return C<Int32>()}
    operator func ==(b:A<T>):C<Int32> {return C<Int32>()}
    operator func !=(b:A<T>):C<Int32> {return C<Int32>()}
    operator func &(b:A<T>):C<Int32>  {return C<Int32>()}
    operator func ^(b:A<T>):C<Int32>  {return C<Int32>()}
    operator func |(b:A<T>):C<Int32>  {return C<Int32>()}
//     operator func ^^(b:A<T>):C<Int32> {return C<Int32>()}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<C<Int32>> = A_B<C<Int32>>()
    var b : A<C<Int32>> = A_B<C<Int32>>()
    var result : Array<(C<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
