// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A_B<T> <: A<T>{}
interface A<T>{
    operator func !():List<Int32> {return [1]}
//    operator func +():List<Int32> {return [1]}
    operator func -():List<Int32> {return [1]}
    /*
    operator func ++():List<Int32> {return [1]}
    operator func --():List<Int32> {return [1]}
    */
    operator func [](b:A<T>):List<Int32> {return [1]}
// operator ** is illegal
    operator func *(b:A<T>):List<Int32>  {return [1]}
    operator func /(b:A<T>):List<Int32>  {return [1]}
    operator func %(b:A<T>):List<Int32>  {return [1]}
// operator *& is illegal
    operator func +(b:A<T>):List<Int32>  {return [1]}
    operator func -(b:A<T>):List<Int32>  {return [1]}
    operator func <<(b:A<T>):List<Int32> {return [1]}
    operator func >>(b:A<T>):List<Int32> {return [1]}
    operator func <(b:A<T>):List<Int32>  {return [1]}
    operator func <=(b:A<T>):List<Int32> {return [1]}
    operator func >(b:A<T>):List<Int32>  {return [1]}
    operator func >=(b:A<T>):List<Int32> {return [1]}
    operator func ==(b:A<T>):List<Int32> {return [1]}
    operator func !=(b:A<T>):List<Int32> {return [1]}
    operator func &(b:A<T>):List<Int32>  {return [1]}
    operator func ^(b:A<T>):List<Int32>  {return [1]}
    operator func |(b:A<T>):List<Int32>  {return [1]}
//     operator func ^^(b:A<T>):List<Int32> {return [1]}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<List<Int32>> = A_B<List<Int32>>()
    var b : A<List<Int32>> = A_B<List<Int32>>()
    var result : Array<(List<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
