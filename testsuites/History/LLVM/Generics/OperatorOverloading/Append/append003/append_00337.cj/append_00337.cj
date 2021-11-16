// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{}
enum E{e(Int64)}
trait update{
    operator func !(a:This):E
//    operator func +(a:This):E
    operator func -(a:This):E
    /*
    operator func ++(a:This):E
    operator func --(a:This):E
    */
    operator func [](a:This,b:This):E
// operator ** is illegal
    operator func *(a:This,b:This):E
    operator func /(a:This,b:This):E
    operator func %(a:This,b:This):E
// operator *& is illegal
    operator func +(a:This,b:This):E
    operator func -(a:This,b:This):E
    operator func <<(a:This,b:This):E
    operator func >>(a:This,b:This):E
    operator func <(a:This,b:This):E
    operator func <=(a:This,b:This):E
    operator func >(a:This,b:This):E
    operator func >=(a:This,b:This):E
    operator func ==(a:This,b:This):E
    operator func !=(a:This,b:This):E
    operator func &(a:This,b:This):E
    operator func ^(a:This,b:This):E
    operator func |(a:This,b:This):E
//     operator func ^^(a:This,b:This):E
// operator +& is illegal
// operator -& is illegal

}

append<T> A<T> with update {
    operator func !(a:A<T>):E {return E.e(1)}
//    operator func +(a:A<T>):E {return E.e(1)}
    operator func -(a:A<T>):E {return E.e(1)}
    /*
    operator func ++(a:A<T>):E {return E.e(1)}
    operator func --(a:A<T>):E {return E.e(1)}
    */
    operator func [](a:A<T>,b:A<T>):E {return E.e(1)}
// operator ** is illegal
    operator func *(a:A<T>,b:A<T>):E  {return E.e(1)}
    operator func /(a:A<T>,b:A<T>):E  {return E.e(1)}
    operator func %(a:A<T>,b:A<T>):E  {return E.e(1)}
// operator *& is illegal
    operator func +(a:A<T>,b:A<T>):E  {return E.e(1)}
    operator func -(a:A<T>,b:A<T>):E  {return E.e(1)}
    operator func <<(a:A<T>,b:A<T>):E {return E.e(1)}
    operator func >>(a:A<T>,b:A<T>):E {return E.e(1)}
    operator func <(a:A<T>,b:A<T>):E  {return E.e(1)}
    operator func <=(a:A<T>,b:A<T>):E {return E.e(1)}
    operator func >(a:A<T>,b:A<T>):E  {return E.e(1)}
    operator func >=(a:A<T>,b:A<T>):E {return E.e(1)}
    operator func ==(a:A<T>,b:A<T>):E {return E.e(1)}
    operator func !=(a:A<T>,b:A<T>):E {return E.e(1)}
    operator func &(a:A<T>,b:A<T>):E  {return E.e(1)}
    operator func ^(a:A<T>,b:A<T>):E  {return E.e(1)}
    operator func |(a:A<T>,b:A<T>):E  {return E.e(1)}
//     operator func ^^(a:A<T>,b:A<T>):E {return E.e(1)}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    var result : E[] = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
