// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{}
class C{}
trait update{
    operator func !(a:This):C
//    operator func +(a:This):C
    operator func -(a:This):C
    /*
    operator func ++(a:This):C
    operator func --(a:This):C
    */
    operator func [](a:This,b:This):C
// operator ** is illegal
    operator func *(a:This,b:This):C
    operator func /(a:This,b:This):C
    operator func %(a:This,b:This):C
// operator *& is illegal
    operator func +(a:This,b:This):C
    operator func -(a:This,b:This):C
    operator func <<(a:This,b:This):C
    operator func >>(a:This,b:This):C
    operator func <(a:This,b:This):C
    operator func <=(a:This,b:This):C
    operator func >(a:This,b:This):C
    operator func >=(a:This,b:This):C
    operator func ==(a:This,b:This):C
    operator func !=(a:This,b:This):C
    operator func &(a:This,b:This):C
    operator func ^(a:This,b:This):C
    operator func |(a:This,b:This):C
//     operator func ^^(a:This,b:This):C
// operator +& is illegal
// operator -& is illegal

}

append<T> A<T> with update {
    operator func !(a:A<T>):C {return C()}
//    operator func +(a:A<T>):C {return C()}
    operator func -(a:A<T>):C {return C()}
    /*
    operator func ++(a:A<T>):C {return C()}
    operator func --(a:A<T>):C {return C()}
    */
    operator func [](a:A<T>,b:A<T>):C {return C()}
// operator ** is illegal
    operator func *(a:A<T>,b:A<T>):C  {return C()}
    operator func /(a:A<T>,b:A<T>):C  {return C()}
    operator func %(a:A<T>,b:A<T>):C  {return C()}
// operator *& is illegal
    operator func +(a:A<T>,b:A<T>):C  {return C()}
    operator func -(a:A<T>,b:A<T>):C  {return C()}
    operator func <<(a:A<T>,b:A<T>):C {return C()}
    operator func >>(a:A<T>,b:A<T>):C {return C()}
    operator func <(a:A<T>,b:A<T>):C  {return C()}
    operator func <=(a:A<T>,b:A<T>):C {return C()}
    operator func >(a:A<T>,b:A<T>):C  {return C()}
    operator func >=(a:A<T>,b:A<T>):C {return C()}
    operator func ==(a:A<T>,b:A<T>):C {return C()}
    operator func !=(a:A<T>,b:A<T>):C {return C()}
    operator func &(a:A<T>,b:A<T>):C  {return C()}
    operator func ^(a:A<T>,b:A<T>):C  {return C()}
    operator func |(a:A<T>,b:A<T>):C  {return C()}
//     operator func ^^(a:A<T>,b:A<T>):C {return C()}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    var result : C[] = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
