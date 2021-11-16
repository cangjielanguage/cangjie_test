// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{}
interface D<T>{}
    class C <: D<Int32>{}
    
trait update{
    operator func !(a:This):D<Int32>
//    operator func +(a:This):D<Int32>
    operator func -(a:This):D<Int32>
    /*
    operator func ++(a:This):D<Int32>
    operator func --(a:This):D<Int32>
    */
    operator func [](a:This,b:This):D<Int32>
// operator ** is illegal
    operator func *(a:This,b:This):D<Int32>
    operator func /(a:This,b:This):D<Int32>
    operator func %(a:This,b:This):D<Int32>
// operator *& is illegal
    operator func +(a:This,b:This):D<Int32>
    operator func -(a:This,b:This):D<Int32>
    operator func <<(a:This,b:This):D<Int32>
    operator func >>(a:This,b:This):D<Int32>
    operator func <(a:This,b:This):D<Int32>
    operator func <=(a:This,b:This):D<Int32>
    operator func >(a:This,b:This):D<Int32>
    operator func >=(a:This,b:This):D<Int32>
    operator func ==(a:This,b:This):D<Int32>
    operator func !=(a:This,b:This):D<Int32>
    operator func &(a:This,b:This):D<Int32>
    operator func ^(a:This,b:This):D<Int32>
    operator func |(a:This,b:This):D<Int32>
//     operator func ^^(a:This,b:This):D<Int32>
// operator +& is illegal
// operator -& is illegal

}

append<T> A<T> with update {
    operator func !(a:A<T>):D<Int32> {return C()}
//    operator func +(a:A<T>):D<Int32> {return C()}
    operator func -(a:A<T>):D<Int32> {return C()}
    /*
    operator func ++(a:A<T>):D<Int32> {return C()}
    operator func --(a:A<T>):D<Int32> {return C()}
    */
    operator func [](a:A<T>,b:A<T>):D<Int32> {return C()}
// operator ** is illegal
    operator func *(a:A<T>,b:A<T>):D<Int32>  {return C()}
    operator func /(a:A<T>,b:A<T>):D<Int32>  {return C()}
    operator func %(a:A<T>,b:A<T>):D<Int32>  {return C()}
// operator *& is illegal
    operator func +(a:A<T>,b:A<T>):D<Int32>  {return C()}
    operator func -(a:A<T>,b:A<T>):D<Int32>  {return C()}
    operator func <<(a:A<T>,b:A<T>):D<Int32> {return C()}
    operator func >>(a:A<T>,b:A<T>):D<Int32> {return C()}
    operator func <(a:A<T>,b:A<T>):D<Int32>  {return C()}
    operator func <=(a:A<T>,b:A<T>):D<Int32> {return C()}
    operator func >(a:A<T>,b:A<T>):D<Int32>  {return C()}
    operator func >=(a:A<T>,b:A<T>):D<Int32> {return C()}
    operator func ==(a:A<T>,b:A<T>):D<Int32> {return C()}
    operator func !=(a:A<T>,b:A<T>):D<Int32> {return C()}
    operator func &(a:A<T>,b:A<T>):D<Int32>  {return C()}
    operator func ^(a:A<T>,b:A<T>):D<Int32>  {return C()}
    operator func |(a:A<T>,b:A<T>):D<Int32>  {return C()}
//     operator func ^^(a:A<T>,b:A<T>):D<Int32> {return C()}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    var result : D<Int32>[] = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
