// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
class A_B<T> <: A<T>{}
interface A<T>{
    operator func !():HashMap<Int32,Int32> {return HashMap<Int32,Int32>([(1,1)])}
//    operator func +():HashMap<Int32,Int32> {return HashMap<Int32,Int32>([(1,1)])}
    operator func -():HashMap<Int32,Int32> {return HashMap<Int32,Int32>([(1,1)])}
    /*
    operator func ++():HashMap<Int32,Int32> {return HashMap<Int32,Int32>([(1,1)])}
    operator func --():HashMap<Int32,Int32> {return HashMap<Int32,Int32>([(1,1)])}
    */
    operator func [](b:A<T>):HashMap<Int32,Int32> {return HashMap<Int32,Int32>([(1,1)])}
// operator ** is illegal
    operator func *(b:A<T>):HashMap<Int32,Int32>  {return HashMap<Int32,Int32>([(1,1)])}
    operator func /(b:A<T>):HashMap<Int32,Int32>  {return HashMap<Int32,Int32>([(1,1)])}
    operator func %(b:A<T>):HashMap<Int32,Int32>  {return HashMap<Int32,Int32>([(1,1)])}
// operator *& is illegal
    operator func +(b:A<T>):HashMap<Int32,Int32>  {return HashMap<Int32,Int32>([(1,1)])}
    operator func -(b:A<T>):HashMap<Int32,Int32>  {return HashMap<Int32,Int32>([(1,1)])}
    operator func <<(b:A<T>):HashMap<Int32,Int32> {return HashMap<Int32,Int32>([(1,1)])}
    operator func >>(b:A<T>):HashMap<Int32,Int32> {return HashMap<Int32,Int32>([(1,1)])}
    operator func <(b:A<T>):HashMap<Int32,Int32>  {return HashMap<Int32,Int32>([(1,1)])}
    operator func <=(b:A<T>):HashMap<Int32,Int32> {return HashMap<Int32,Int32>([(1,1)])}
    operator func >(b:A<T>):HashMap<Int32,Int32>  {return HashMap<Int32,Int32>([(1,1)])}
    operator func >=(b:A<T>):HashMap<Int32,Int32> {return HashMap<Int32,Int32>([(1,1)])}
    operator func ==(b:A<T>):HashMap<Int32,Int32> {return HashMap<Int32,Int32>([(1,1)])}
    operator func !=(b:A<T>):HashMap<Int32,Int32> {return HashMap<Int32,Int32>([(1,1)])}
    operator func &(b:A<T>):HashMap<Int32,Int32>  {return HashMap<Int32,Int32>([(1,1)])}
    operator func ^(b:A<T>):HashMap<Int32,Int32>  {return HashMap<Int32,Int32>([(1,1)])}
    operator func |(b:A<T>):HashMap<Int32,Int32>  {return HashMap<Int32,Int32>([(1,1)])}
//     operator func ^^(b:A<T>):HashMap<Int32,Int32> {return HashMap<Int32,Int32>([(1,1)])}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<HashMap<Int32,Int32>> = A_B<HashMap<Int32,Int32>>()
    var b : A<HashMap<Int32,Int32>> = A_B<HashMap<Int32,Int32>>()
    var result : Array<(HashMap<Int32,Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
