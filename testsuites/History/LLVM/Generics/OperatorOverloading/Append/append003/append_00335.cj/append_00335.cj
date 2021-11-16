// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{}
interface D{}
    class C <: D{}
    
trait update{
    operator func !(a:This):D
//    operator func +(a:This):D
    operator func -(a:This):D
    /*
    operator func ++(a:This):D
    operator func --(a:This):D
    */
    operator func [](a:This,b:This):D
// operator ** is illegal
    operator func *(a:This,b:This):D
    operator func /(a:This,b:This):D
    operator func %(a:This,b:This):D
// operator *& is illegal
    operator func +(a:This,b:This):D
    operator func -(a:This,b:This):D
    operator func <<(a:This,b:This):D
    operator func >>(a:This,b:This):D
    operator func <(a:This,b:This):D
    operator func <=(a:This,b:This):D
    operator func >(a:This,b:This):D
    operator func >=(a:This,b:This):D
    operator func ==(a:This,b:This):D
    operator func !=(a:This,b:This):D
    operator func &(a:This,b:This):D
    operator func ^(a:This,b:This):D
    operator func |(a:This,b:This):D
//     operator func ^^(a:This,b:This):D
// operator +& is illegal
// operator -& is illegal

}

append<T> A<T> with update {
    operator func !(a:A<T>):D {return C()}
//    operator func +(a:A<T>):D {return C()}
    operator func -(a:A<T>):D {return C()}
    /*
    operator func ++(a:A<T>):D {return C()}
    operator func --(a:A<T>):D {return C()}
    */
    operator func [](a:A<T>,b:A<T>):D {return C()}
// operator ** is illegal
    operator func *(a:A<T>,b:A<T>):D  {return C()}
    operator func /(a:A<T>,b:A<T>):D  {return C()}
    operator func %(a:A<T>,b:A<T>):D  {return C()}
// operator *& is illegal
    operator func +(a:A<T>,b:A<T>):D  {return C()}
    operator func -(a:A<T>,b:A<T>):D  {return C()}
    operator func <<(a:A<T>,b:A<T>):D {return C()}
    operator func >>(a:A<T>,b:A<T>):D {return C()}
    operator func <(a:A<T>,b:A<T>):D  {return C()}
    operator func <=(a:A<T>,b:A<T>):D {return C()}
    operator func >(a:A<T>,b:A<T>):D  {return C()}
    operator func >=(a:A<T>,b:A<T>):D {return C()}
    operator func ==(a:A<T>,b:A<T>):D {return C()}
    operator func !=(a:A<T>,b:A<T>):D {return C()}
    operator func &(a:A<T>,b:A<T>):D  {return C()}
    operator func ^(a:A<T>,b:A<T>):D  {return C()}
    operator func |(a:A<T>,b:A<T>):D  {return C()}
//     operator func ^^(a:A<T>,b:A<T>):D {return C()}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    var result : D[] = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
