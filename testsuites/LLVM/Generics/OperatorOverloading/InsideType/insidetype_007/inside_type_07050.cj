// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A_B<T> <: A<T>{}
interface A<T>{
    operator func !():Int16 {return 0}
//    operator func +():Int16 {return 0}
    operator func -():Int16 {return 0}
    /*
    operator func ++():Int16 {return 0}
    operator func --():Int16 {return 0}
    */
    operator func [](b:A<T>):Int16 {return 0}
// operator ** is illegal
    operator func *(b:A<T>):Int16  {return 0}
    operator func /(b:A<T>):Int16  {return 0}
    operator func %(b:A<T>):Int16  {return 0}
// operator *& is illegal
    operator func +(b:A<T>):Int16  {return 0}
    operator func -(b:A<T>):Int16  {return 0}
    operator func <<(b:A<T>):Int16 {return 0}
    operator func >>(b:A<T>):Int16 {return 0}
    operator func <(b:A<T>):Int16  {return 0}
    operator func <=(b:A<T>):Int16 {return 0}
    operator func >(b:A<T>):Int16  {return 0}
    operator func >=(b:A<T>):Int16 {return 0}
    operator func ==(b:A<T>):Int16 {return 0}
    operator func !=(b:A<T>):Int16 {return 0}
    operator func &(b:A<T>):Int16  {return 0}
    operator func ^(b:A<T>):Int16  {return 0}
    operator func |(b:A<T>):Int16  {return 0}
//     operator func ^^(b:A<T>):Int16 {return 0}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int16> = A_B<Int16>()
    var b : A<Int16> = A_B<Int16>()
    var result : Array<(Int16)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
