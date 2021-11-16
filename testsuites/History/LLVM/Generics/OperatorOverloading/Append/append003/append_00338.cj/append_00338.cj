// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{}
enum E<T>{e(T)}
trait update{
    operator func !(a:This):E<Int32>
//    operator func +(a:This):E<Int32>
    operator func -(a:This):E<Int32>
    /*
    operator func ++(a:This):E<Int32>
    operator func --(a:This):E<Int32>
    */
    operator func [](a:This,b:This):E<Int32>
// operator ** is illegal
    operator func *(a:This,b:This):E<Int32>
    operator func /(a:This,b:This):E<Int32>
    operator func %(a:This,b:This):E<Int32>
// operator *& is illegal
    operator func +(a:This,b:This):E<Int32>
    operator func -(a:This,b:This):E<Int32>
    operator func <<(a:This,b:This):E<Int32>
    operator func >>(a:This,b:This):E<Int32>
    operator func <(a:This,b:This):E<Int32>
    operator func <=(a:This,b:This):E<Int32>
    operator func >(a:This,b:This):E<Int32>
    operator func >=(a:This,b:This):E<Int32>
    operator func ==(a:This,b:This):E<Int32>
    operator func !=(a:This,b:This):E<Int32>
    operator func &(a:This,b:This):E<Int32>
    operator func ^(a:This,b:This):E<Int32>
    operator func |(a:This,b:This):E<Int32>
//     operator func ^^(a:This,b:This):E<Int32>
// operator +& is illegal
// operator -& is illegal

}

append<T> A<T> with update {
    operator func !(a:A<T>):E<Int32> {return E<Int32>.e(1)}
//    operator func +(a:A<T>):E<Int32> {return E<Int32>.e(1)}
    operator func -(a:A<T>):E<Int32> {return E<Int32>.e(1)}
    /*
    operator func ++(a:A<T>):E<Int32> {return E<Int32>.e(1)}
    operator func --(a:A<T>):E<Int32> {return E<Int32>.e(1)}
    */
    operator func [](a:A<T>,b:A<T>):E<Int32> {return E<Int32>.e(1)}
// operator ** is illegal
    operator func *(a:A<T>,b:A<T>):E<Int32>  {return E<Int32>.e(1)}
    operator func /(a:A<T>,b:A<T>):E<Int32>  {return E<Int32>.e(1)}
    operator func %(a:A<T>,b:A<T>):E<Int32>  {return E<Int32>.e(1)}
// operator *& is illegal
    operator func +(a:A<T>,b:A<T>):E<Int32>  {return E<Int32>.e(1)}
    operator func -(a:A<T>,b:A<T>):E<Int32>  {return E<Int32>.e(1)}
    operator func <<(a:A<T>,b:A<T>):E<Int32> {return E<Int32>.e(1)}
    operator func >>(a:A<T>,b:A<T>):E<Int32> {return E<Int32>.e(1)}
    operator func <(a:A<T>,b:A<T>):E<Int32>  {return E<Int32>.e(1)}
    operator func <=(a:A<T>,b:A<T>):E<Int32> {return E<Int32>.e(1)}
    operator func >(a:A<T>,b:A<T>):E<Int32>  {return E<Int32>.e(1)}
    operator func >=(a:A<T>,b:A<T>):E<Int32> {return E<Int32>.e(1)}
    operator func ==(a:A<T>,b:A<T>):E<Int32> {return E<Int32>.e(1)}
    operator func !=(a:A<T>,b:A<T>):E<Int32> {return E<Int32>.e(1)}
    operator func &(a:A<T>,b:A<T>):E<Int32>  {return E<Int32>.e(1)}
    operator func ^(a:A<T>,b:A<T>):E<Int32>  {return E<Int32>.e(1)}
    operator func |(a:A<T>,b:A<T>):E<Int32>  {return E<Int32>.e(1)}
//     operator func ^^(a:A<T>,b:A<T>):E<Int32> {return E<Int32>.e(1)}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    var result : E<Int32>[] = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
