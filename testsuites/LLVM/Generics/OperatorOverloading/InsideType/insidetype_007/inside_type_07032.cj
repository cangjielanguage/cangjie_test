// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class C<T>{}

class A<T>{
    operator func !():C<T> {return C<T>()}
//    operator func +():C<T> {return C<T>()}
    operator func -():C<T> {return C<T>()}
    /*
    operator func ++():C<T> {return C<T>()}
    operator func --():C<T> {return C<T>()}
    */
    operator func [](b:A<T>):C<T> {return C<T>()}
// operator ** is illegal
    operator func *(b:A<T>):C<T>  {return C<T>()}
    operator func /(b:A<T>):C<T>  {return C<T>()}
    operator func %(b:A<T>):C<T>  {return C<T>()}
// operator *& is illegal
    operator func +(b:A<T>):C<T>  {return C<T>()}
    operator func -(b:A<T>):C<T>  {return C<T>()}
    operator func <<(b:A<T>):C<T> {return C<T>()}
    operator func >>(b:A<T>):C<T> {return C<T>()}
    operator func <(b:A<T>):C<T>  {return C<T>()}
    operator func <=(b:A<T>):C<T> {return C<T>()}
    operator func >(b:A<T>):C<T>  {return C<T>()}
    operator func >=(b:A<T>):C<T> {return C<T>()}
    operator func ==(b:A<T>):C<T> {return C<T>()}
    operator func !=(b:A<T>):C<T> {return C<T>()}
    operator func &(b:A<T>):C<T>  {return C<T>()}
    operator func ^(b:A<T>):C<T>  {return C<T>()}
    operator func |(b:A<T>):C<T>  {return C<T>()}
//     operator func ^^(b:A<T>):C<T> {return C<T>()}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    var result : Array<(C<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
