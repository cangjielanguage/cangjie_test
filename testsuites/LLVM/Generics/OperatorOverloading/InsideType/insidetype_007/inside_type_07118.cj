// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



record A<T>{
    operator func !():(Int32)->Int32 {return { input:Int32 => input}}
//    operator func +():(Int32)->Int32 {return { input:Int32 => input}}
    operator func -():(Int32)->Int32 {return { input:Int32 => input}}
    /*
    operator func ++():(Int32)->Int32 {return { input:Int32 => input}}
    operator func --():(Int32)->Int32 {return { input:Int32 => input}}
    */
    operator func [](b:A<T>):(Int32)->Int32 {return { input:Int32 => input}}
// operator ** is illegal
    operator func *(b:A<T>):(Int32)->Int32  {return { input:Int32 => input}}
    operator func /(b:A<T>):(Int32)->Int32  {return { input:Int32 => input}}
    operator func %(b:A<T>):(Int32)->Int32  {return { input:Int32 => input}}
// operator *& is illegal
    operator func +(b:A<T>):(Int32)->Int32  {return { input:Int32 => input}}
    operator func -(b:A<T>):(Int32)->Int32  {return { input:Int32 => input}}
    operator func <<(b:A<T>):(Int32)->Int32 {return { input:Int32 => input}}
    operator func >>(b:A<T>):(Int32)->Int32 {return { input:Int32 => input}}
    operator func <(b:A<T>):(Int32)->Int32  {return { input:Int32 => input}}
    operator func <=(b:A<T>):(Int32)->Int32 {return {input:Int32 => input}}
    operator func >(b:A<T>):(Int32)->Int32  {return { input:Int32 => input}}
    operator func >=(b:A<T>):(Int32)->Int32 {return {input:Int32 => input}}
    operator func ==(b:A<T>):(Int32)->Int32 {return {input:Int32 => input}}
    operator func !=(b:A<T>):(Int32)->Int32 {return {input:Int32 => input}}
    operator func &(b:A<T>):(Int32)->Int32  {return { input:Int32 => input}}
    operator func ^(b:A<T>):(Int32)->Int32  {return { input:Int32 => input}}
    operator func |(b:A<T>):(Int32)->Int32  {return { input:Int32 => input}}
//     operator func ^^(b:A<T>):(Int32)->Int32 {return { input:Int32 => input}}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<(Int32)->Int32> = A<(Int32)->Int32>()
    var b : A<(Int32)->Int32> = A<(Int32)->Int32>()
    var result : Array<((Int32)->Int32)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
