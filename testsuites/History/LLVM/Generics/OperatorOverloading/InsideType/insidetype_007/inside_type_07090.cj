// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A_B<T> <: A<T>{}
interface A<T>{
    operator func !():Map<Int32,Int32> {return #{1:1}}
//    operator func +():Map<Int32,Int32> {return #{1:1}}
    operator func -():Map<Int32,Int32> {return #{1:1}}
    /*
    operator func ++():Map<Int32,Int32> {return #{1:1}}
    operator func --():Map<Int32,Int32> {return #{1:1}}
    */
    operator func [](b:A<T>):Map<Int32,Int32> {return #{1:1}}
// operator ** is illegal
    operator func *(b:A<T>):Map<Int32,Int32>  {return #{1:1}}
    operator func /(b:A<T>):Map<Int32,Int32>  {return #{1:1}}
    operator func %(b:A<T>):Map<Int32,Int32>  {return #{1:1}}
// operator *& is illegal
    operator func +(b:A<T>):Map<Int32,Int32>  {return #{1:1}}
    operator func -(b:A<T>):Map<Int32,Int32>  {return #{1:1}}
    operator func <<(b:A<T>):Map<Int32,Int32> {return #{1:1}}
    operator func >>(b:A<T>):Map<Int32,Int32> {return #{1:1}}
    operator func <(b:A<T>):Map<Int32,Int32>  {return #{1:1}}
    operator func <=(b:A<T>):Map<Int32,Int32> {return #{1:1}}
    operator func >(b:A<T>):Map<Int32,Int32>  {return #{1:1}}
    operator func >=(b:A<T>):Map<Int32,Int32> {return #{1:1}}
    operator func ==(b:A<T>):Map<Int32,Int32> {return #{1:1}}
    operator func !=(b:A<T>):Map<Int32,Int32> {return #{1:1}}
    operator func &(b:A<T>):Map<Int32,Int32>  {return #{1:1}}
    operator func ^(b:A<T>):Map<Int32,Int32>  {return #{1:1}}
    operator func |(b:A<T>):Map<Int32,Int32>  {return #{1:1}}
//     operator func ^^(b:A<T>):Map<Int32,Int32> {return #{1:1}}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Map<Int32,Int32>> = A_B<Map<Int32,Int32>>()
    var b : A<Map<Int32,Int32>> = A_B<Map<Int32,Int32>>()
    var result : Array<(Map<Int32,Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
