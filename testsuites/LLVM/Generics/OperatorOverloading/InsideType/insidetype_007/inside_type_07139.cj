// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



record A<T>{
    operator func !():Array<Int32> {return @{1}}
//    operator func +():Array<Int32> {return @{1}}
    operator func -():Array<Int32> {return @{1}}
    /*
    operator func ++():Array<Int32> {return @{1}}
    operator func --():Array<Int32> {return @{1}}
    */
    operator func [](b:A<T>):Array<Int32> {return @{1}}
// operator ** is illegal
    operator func *(b:A<T>):Array<Int32>  {return @{1}}
    operator func /(b:A<T>):Array<Int32>  {return @{1}}
    operator func %(b:A<T>):Array<Int32>  {return @{1}}
// operator *& is illegal
    operator func +(b:A<T>):Array<Int32>  {return @{1}}
    operator func -(b:A<T>):Array<Int32>  {return @{1}}
    operator func <<(b:A<T>):Array<Int32> {return @{1}}
    operator func >>(b:A<T>):Array<Int32> {return @{1}}
    operator func <(b:A<T>):Array<Int32>  {return @{1}}
    operator func <=(b:A<T>):Array<Int32> {return @{1}}
    operator func >(b:A<T>):Array<Int32>  {return @{1}}
    operator func >=(b:A<T>):Array<Int32> {return @{1}}
    operator func ==(b:A<T>):Array<Int32> {return @{1}}
    operator func !=(b:A<T>):Array<Int32> {return @{1}}
    operator func &(b:A<T>):Array<Int32>  {return @{1}}
    operator func ^(b:A<T>):Array<Int32>  {return @{1}}
    operator func |(b:A<T>):Array<Int32>  {return @{1}}
//     operator func ^^(b:A<T>):Array<Int32> {return @{1}}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Array<Int32>> = A<Array<Int32>>()
    var b : A<Array<Int32>> = A<Array<Int32>>()
    var result : Array<(Array<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
