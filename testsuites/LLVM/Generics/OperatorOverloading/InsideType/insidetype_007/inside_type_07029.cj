// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record B<T>{}

class A<T>{
    operator func !():B<T> {return B<T>()}
//    operator func +():B<T> {return B<T>()}
    operator func -():B<T> {return B<T>()}
    /*
    operator func ++():B<T> {return B<T>()}
    operator func --():B<T> {return B<T>()}
    */
    operator func [](b:A<T>):B<T> {return B<T>()}
// operator ** is illegal
    operator func *(b:A<T>):B<T>  {return B<T>()}
    operator func /(b:A<T>):B<T>  {return B<T>()}
    operator func %(b:A<T>):B<T>  {return B<T>()}
// operator *& is illegal
    operator func +(b:A<T>):B<T>  {return B<T>()}
    operator func -(b:A<T>):B<T>  {return B<T>()}
    operator func <<(b:A<T>):B<T> {return B<T>()}
    operator func >>(b:A<T>):B<T> {return B<T>()}
    operator func <(b:A<T>):B<T>  {return B<T>()}
    operator func <=(b:A<T>):B<T> {return B<T>()}
    operator func >(b:A<T>):B<T>  {return B<T>()}
    operator func >=(b:A<T>):B<T> {return B<T>()}
    operator func ==(b:A<T>):B<T> {return B<T>()}
    operator func !=(b:A<T>):B<T> {return B<T>()}
    operator func &(b:A<T>):B<T>  {return B<T>()}
    operator func ^(b:A<T>):B<T>  {return B<T>()}
    operator func |(b:A<T>):B<T>  {return B<T>()}
//     operator func ^^(b:A<T>):B<T> {return B<T>()}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    var result : Array<(B<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
