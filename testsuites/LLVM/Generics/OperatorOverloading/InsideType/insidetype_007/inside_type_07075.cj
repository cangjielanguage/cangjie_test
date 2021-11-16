// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record B{}
class A_B<T> <: A<T>{}
interface A<T>{
    operator func !():B {return B()}
//    operator func +():B {return B()}
    operator func -():B {return B()}
    /*
    operator func ++():B {return B()}
    operator func --():B {return B()}
    */
    operator func [](b:A<T>):B {return B()}
// operator ** is illegal
    operator func *(b:A<T>):B  {return B()}
    operator func /(b:A<T>):B  {return B()}
    operator func %(b:A<T>):B  {return B()}
// operator *& is illegal
    operator func +(b:A<T>):B  {return B()}
    operator func -(b:A<T>):B  {return B()}
    operator func <<(b:A<T>):B {return B()}
    operator func >>(b:A<T>):B {return B()}
    operator func <(b:A<T>):B  {return B()}
    operator func <=(b:A<T>):B {return B()}
    operator func >(b:A<T>):B  {return B()}
    operator func >=(b:A<T>):B {return B()}
    operator func ==(b:A<T>):B {return B()}
    operator func !=(b:A<T>):B {return B()}
    operator func &(b:A<T>):B  {return B()}
    operator func ^(b:A<T>):B  {return B()}
    operator func |(b:A<T>):B  {return B()}
//     operator func ^^(b:A<T>):B {return B()}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<B> = A_B<B>()
    var b : A<B> = A_B<B>()
    var result : Array<(B)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
