// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A_B<T> <: A<T>{}
interface A<T>{
    operator func !():(A_B<T>)->A_B<T> {return { input:A_B<T> => input}}
//    operator func +():(A_B<T>)->A_B<T> {return { input:A_B<T> => input}}
    operator func -():(A_B<T>)->A_B<T> {return { input:A_B<T> => input}}
    /*
    operator func ++():(A_B<T>)->A_B<T> {return { input:A_B<T> => input}}
    operator func --():(A_B<T>)->A_B<T> {return { input:A_B<T> => input}}
    */
    operator func [](b:A<T>):(A_B<T>)->A_B<T> {return { input:A_B<T> => input}}
// operator ** is illegal
    operator func *(b:A<T>):(A_B<T>)->A_B<T>  {return { input:A_B<T> => input}}
    operator func /(b:A<T>):(A_B<T>)->A_B<T>  {return { input:A_B<T> => input}}
    operator func %(b:A<T>):(A_B<T>)->A_B<T>  {return { input:A_B<T> => input}}
// operator *& is illegal
    operator func +(b:A<T>):(A_B<T>)->A_B<T>  {return { input:A_B<T> => input}}
    operator func -(b:A<T>):(A_B<T>)->A_B<T>  {return { input:A_B<T> => input}}
    operator func <<(b:A<T>):(A_B<T>)->A_B<T> {return { input:A_B<T> => input}}
    operator func >>(b:A<T>):(A_B<T>)->A_B<T> {return { input:A_B<T> => input}}
    operator func <(b:A<T>):(A_B<T>)->A_B<T>  {return { input:A_B<T> => input}}
    operator func <=(b:A<T>):(A_B<T>)->A_B<T> {return {input:A_B<T> => input}}
    operator func >(b:A<T>):(A_B<T>)->A_B<T>  {return { input:A_B<T> => input}}
    operator func >=(b:A<T>):(A_B<T>)->A_B<T> {return {input:A_B<T> => input}}
    operator func ==(b:A<T>):(A_B<T>)->A_B<T> {return {input:A_B<T> => input}}
    operator func !=(b:A<T>):(A_B<T>)->A_B<T> {return {input:A_B<T> => input}}
    operator func &(b:A<T>):(A_B<T>)->A_B<T>  {return { input:A_B<T> => input}}
    operator func ^(b:A<T>):(A_B<T>)->A_B<T>  {return { input:A_B<T> => input}}
    operator func |(b:A<T>):(A_B<T>)->A_B<T>  {return { input:A_B<T> => input}}
//     operator func ^^(b:A<T>):(A_B<T>)->A_B<T> {return { input:A_B<T> => input}}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int32> = A_B<Int32>()
    var b : A<Int32> = A_B<Int32>()
    var result : Array<((A_B<Int32>)->A_B<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
