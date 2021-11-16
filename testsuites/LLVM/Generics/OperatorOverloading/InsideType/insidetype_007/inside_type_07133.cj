// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E<T>{e(T)}

record A<T>{
    operator func !():E<Int32> {return E<Int32>.e(1)}
//    operator func +():E<Int32> {return E<Int32>.e(1)}
    operator func -():E<Int32> {return E<Int32>.e(1)}
    /*
    operator func ++():E<Int32> {return E<Int32>.e(1)}
    operator func --():E<Int32> {return E<Int32>.e(1)}
    */
    operator func [](b:A<T>):E<Int32> {return E<Int32>.e(1)}
// operator ** is illegal
    operator func *(b:A<T>):E<Int32>  {return E<Int32>.e(1)}
    operator func /(b:A<T>):E<Int32>  {return E<Int32>.e(1)}
    operator func %(b:A<T>):E<Int32>  {return E<Int32>.e(1)}
// operator *& is illegal
    operator func +(b:A<T>):E<Int32>  {return E<Int32>.e(1)}
    operator func -(b:A<T>):E<Int32>  {return E<Int32>.e(1)}
    operator func <<(b:A<T>):E<Int32> {return E<Int32>.e(1)}
    operator func >>(b:A<T>):E<Int32> {return E<Int32>.e(1)}
    operator func <(b:A<T>):E<Int32>  {return E<Int32>.e(1)}
    operator func <=(b:A<T>):E<Int32> {return E<Int32>.e(1)}
    operator func >(b:A<T>):E<Int32>  {return E<Int32>.e(1)}
    operator func >=(b:A<T>):E<Int32> {return E<Int32>.e(1)}
    operator func ==(b:A<T>):E<Int32> {return E<Int32>.e(1)}
    operator func !=(b:A<T>):E<Int32> {return E<Int32>.e(1)}
    operator func &(b:A<T>):E<Int32>  {return E<Int32>.e(1)}
    operator func ^(b:A<T>):E<Int32>  {return E<Int32>.e(1)}
    operator func |(b:A<T>):E<Int32>  {return E<Int32>.e(1)}
//     operator func ^^(b:A<T>):E<Int32> {return E<Int32>.e(1)}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<E<Int32>> = A<E<Int32>>()
    var b : A<E<Int32>> = A<E<Int32>>()
    var result : Array<(E<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
