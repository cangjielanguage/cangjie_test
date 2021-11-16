// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface D<T>{}
    class C <: D<Int32>{}
    

record A<T>{
    operator func !():D<Int32> {return C()}
//    operator func +():D<Int32> {return C()}
    operator func -():D<Int32> {return C()}
    /*
    operator func ++():D<Int32> {return C()}
    operator func --():D<Int32> {return C()}
    */
    operator func [](b:A<T>):D<Int32> {return C()}
// operator ** is illegal
    operator func *(b:A<T>):D<Int32>  {return C()}
    operator func /(b:A<T>):D<Int32>  {return C()}
    operator func %(b:A<T>):D<Int32>  {return C()}
// operator *& is illegal
    operator func +(b:A<T>):D<Int32>  {return C()}
    operator func -(b:A<T>):D<Int32>  {return C()}
    operator func <<(b:A<T>):D<Int32> {return C()}
    operator func >>(b:A<T>):D<Int32> {return C()}
    operator func <(b:A<T>):D<Int32>  {return C()}
    operator func <=(b:A<T>):D<Int32> {return C()}
    operator func >(b:A<T>):D<Int32>  {return C()}
    operator func >=(b:A<T>):D<Int32> {return C()}
    operator func ==(b:A<T>):D<Int32> {return C()}
    operator func !=(b:A<T>):D<Int32> {return C()}
    operator func &(b:A<T>):D<Int32>  {return C()}
    operator func ^(b:A<T>):D<Int32>  {return C()}
    operator func |(b:A<T>):D<Int32>  {return C()}
//     operator func ^^(b:A<T>):D<Int32> {return C()}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<D<Int32>> = A<D<Int32>>()
    var b : A<D<Int32>> = A<D<Int32>>()
    var result : Array<(D<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
