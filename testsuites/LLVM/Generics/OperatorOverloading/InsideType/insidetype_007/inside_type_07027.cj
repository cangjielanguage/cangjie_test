// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



class A<T>{
    operator func !():(A<Int32>)->A<Int32> {return { input:A<Int32> => input}}
//    operator func +():(A<Int32>)->A<Int32> {return { input:A<Int32> => input}}
    operator func -():(A<Int32>)->A<Int32> {return { input:A<Int32> => input}}
    /*
    operator func ++():(A<Int32>)->A<Int32> {return { input:A<Int32> => input}}
    operator func --():(A<Int32>)->A<Int32> {return { input:A<Int32> => input}}
    */
    operator func [](b:A<T>):(A<Int32>)->A<Int32> {return { input:A<Int32> => input}}
// operator ** is illegal
    operator func *(b:A<T>):(A<Int32>)->A<Int32>  {return { input:A<Int32> => input}}
    operator func /(b:A<T>):(A<Int32>)->A<Int32>  {return { input:A<Int32> => input}}
    operator func %(b:A<T>):(A<Int32>)->A<Int32>  {return { input:A<Int32> => input}}
// operator *& is illegal
    operator func +(b:A<T>):(A<Int32>)->A<Int32>  {return { input:A<Int32> => input}}
    operator func -(b:A<T>):(A<Int32>)->A<Int32>  {return { input:A<Int32> => input}}
    operator func <<(b:A<T>):(A<Int32>)->A<Int32> {return { input:A<Int32> => input}}
    operator func >>(b:A<T>):(A<Int32>)->A<Int32> {return { input:A<Int32> => input}}
    operator func <(b:A<T>):(A<Int32>)->A<Int32>  {return { input:A<Int32> => input}}
    operator func <=(b:A<T>):(A<Int32>)->A<Int32> {return {input:A<Int32> => input}}
    operator func >(b:A<T>):(A<Int32>)->A<Int32>  {return { input:A<Int32> => input}}
    operator func >=(b:A<T>):(A<Int32>)->A<Int32> {return {input:A<Int32> => input}}
    operator func ==(b:A<T>):(A<Int32>)->A<Int32> {return {input:A<Int32> => input}}
    operator func !=(b:A<T>):(A<Int32>)->A<Int32> {return {input:A<Int32> => input}}
    operator func &(b:A<T>):(A<Int32>)->A<Int32>  {return { input:A<Int32> => input}}
    operator func ^(b:A<T>):(A<Int32>)->A<Int32>  {return { input:A<Int32> => input}}
    operator func |(b:A<T>):(A<Int32>)->A<Int32>  {return { input:A<Int32> => input}}
//     operator func ^^(b:A<T>):(A<Int32>)->A<Int32> {return { input:A<Int32> => input}}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<(A<Int32>)->A<Int32>> = A<(A<Int32>)->A<Int32>>()
    var b : A<(A<Int32>)->A<Int32>> = A<(A<Int32>)->A<Int32>>()
    var result : Array<((A<Int32>)->A<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
