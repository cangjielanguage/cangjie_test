// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum E<T>{e}

class A<T>{
    operator func !():E<T> {return E<T>.e}
//    operator func +():E<T> {return E<T>.e}
    operator func -():E<T> {return E<T>.e}
    /*
    operator func ++():E<T> {return E<T>.e}
    operator func --():E<T> {return E<T>.e}
    */
    operator func [](b:A<T>):E<T> {return E<T>.e}
// operator ** is illegal
    operator func *(b:A<T>):E<T>  {return E<T>.e}
    operator func /(b:A<T>):E<T>  {return E<T>.e}
    operator func %(b:A<T>):E<T>  {return E<T>.e}
// operator *& is illegal
    operator func +(b:A<T>):E<T>  {return E<T>.e}
    operator func -(b:A<T>):E<T>  {return E<T>.e}
    operator func <<(b:A<T>):E<T> {return E<T>.e}
    operator func >>(b:A<T>):E<T> {return E<T>.e}
    operator func <(b:A<T>):E<T>  {return E<T>.e}
    operator func <=(b:A<T>):E<T> {return E<T>.e}
    operator func >(b:A<T>):E<T>  {return E<T>.e}
    operator func >=(b:A<T>):E<T> {return E<T>.e}
    operator func ==(b:A<T>):E<T> {return E<T>.e}
    operator func !=(b:A<T>):E<T> {return E<T>.e}
    operator func &(b:A<T>):E<T>  {return E<T>.e}
    operator func ^(b:A<T>):E<T>  {return E<T>.e}
    operator func |(b:A<T>):E<T>  {return E<T>.e}
//     operator func ^^(b:A<T>):E<T> {return E<T>.e}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    var result : Array<(E<Int32>)> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
