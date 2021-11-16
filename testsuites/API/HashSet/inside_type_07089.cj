// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
class A_B<T> <: A<T>{}
interface A<T>{
    operator func !():HashSet<Int32> {return HashSet<Int32>([1])}
//    operator func +():HashSet<Int32> {return HashSet<Int32>([1])}
    operator func -():HashSet<Int32> {return HashSet<Int32>([1])}
    /*
    operator func ++():HashSet<Int32> {return HashSet<Int32>([1])}
    operator func --():HashSet<Int32> {return HashSet<Int32>([1])}
    */
    operator func [](b:A<T>):HashSet<Int32> {return HashSet<Int32>([1])}
// operator ** is illegal
    operator func *(b:A<T>):HashSet<Int32>  {return HashSet<Int32>([1])}
    operator func /(b:A<T>):HashSet<Int32>  {return HashSet<Int32>([1])}
    operator func %(b:A<T>):HashSet<Int32>  {return HashSet<Int32>([1])}
// operator *& is illegal
    operator func +(b:A<T>):HashSet<Int32>  {return HashSet<Int32>([1])}
    operator func -(b:A<T>):HashSet<Int32>  {return HashSet<Int32>([1])}
    operator func <<(b:A<T>):HashSet<Int32> {return HashSet<Int32>([1])}
    operator func >>(b:A<T>):HashSet<Int32> {return HashSet<Int32>([1])}
    operator func <(b:A<T>):HashSet<Int32>  {return HashSet<Int32>([1])}
    operator func <=(b:A<T>):HashSet<Int32> {return HashSet<Int32>([1])}
    operator func >(b:A<T>):HashSet<Int32>  {return HashSet<Int32>([1])}
    operator func >=(b:A<T>):HashSet<Int32> {return HashSet<Int32>([1])}
    operator func ==(b:A<T>):HashSet<Int32> {return HashSet<Int32>([1])}
    operator func !=(b:A<T>):HashSet<Int32> {return HashSet<Int32>([1])}
    operator func &(b:A<T>):HashSet<Int32>  {return HashSet<Int32>([1])}
    operator func ^(b:A<T>):HashSet<Int32>  {return HashSet<Int32>([1])}
    operator func |(b:A<T>):HashSet<Int32>  {return HashSet<Int32>([1])}
//     operator func ^^(b:A<T>):HashSet<Int32> {return HashSet<Int32>([1])}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<HashSet<Int32>> = A_B<HashSet<Int32>>()
    var b : A<HashSet<Int32>> = A_B<HashSet<Int32>>()
    var result : Array<(HashSet<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
