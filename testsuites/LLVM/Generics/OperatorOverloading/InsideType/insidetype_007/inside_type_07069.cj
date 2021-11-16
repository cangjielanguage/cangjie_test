// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A_B<T> <: A<T>{}
interface A<T>{
    operator func !():Range<Int32> {return 0..10}
    //operator func +():Range<Int32> {return 0..10}
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
    var a : A<Range<Int32>> = A_B<Range<Int32>>()
    var b : A<Range<Int32>> = A_B<Range<Int32>>()
    var result : Array<(Range<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
