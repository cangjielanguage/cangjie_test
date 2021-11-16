// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



class A<T>{
    operator func !():Set<Int32> {return #{1}}
//    operator func +():Set<Int32> {return #{1}}
    operator func -():Set<Int32> {return #{1}}
    /*
    operator func ++():Set<Int32> {return #{1}}
    operator func --():Set<Int32> {return #{1}}
    */
    operator func [](b:A<T>):Set<Int32> {return #{1}}
// operator ** is illegal
    operator func *(b:A<T>):Set<Int32>  {return #{1}}
    operator func /(b:A<T>):Set<Int32>  {return #{1}}
    operator func %(b:A<T>):Set<Int32>  {return #{1}}
// operator *& is illegal
    operator func +(b:A<T>):Set<Int32>  {return #{1}}
    operator func -(b:A<T>):Set<Int32>  {return #{1}}
    operator func <<(b:A<T>):Set<Int32> {return #{1}}
    operator func >>(b:A<T>):Set<Int32> {return #{1}}
    operator func <(b:A<T>):Set<Int32>  {return #{1}}
    operator func <=(b:A<T>):Set<Int32> {return #{1}}
    operator func >(b:A<T>):Set<Int32>  {return #{1}}
    operator func >=(b:A<T>):Set<Int32> {return #{1}}
    operator func ==(b:A<T>):Set<Int32> {return #{1}}
    operator func !=(b:A<T>):Set<Int32> {return #{1}}
    operator func &(b:A<T>):Set<Int32>  {return #{1}}
    operator func ^(b:A<T>):Set<Int32>  {return #{1}}
    operator func |(b:A<T>):Set<Int32>  {return #{1}}
//     operator func ^^(b:A<T>):Set<Int32> {return #{1}}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Set<Int32>> = A<Set<Int32>>()
    var b : A<Set<Int32>> = A<Set<Int32>>()
    var result : Array<(Set<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
