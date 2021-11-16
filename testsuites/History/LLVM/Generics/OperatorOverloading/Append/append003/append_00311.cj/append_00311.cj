// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{}

trait update{
    operator func !(a:This):UInt16
//    operator func +(a:This):UInt16
    operator func -(a:This):UInt16
    /*
    operator func ++(a:This):UInt16
    operator func --(a:This):UInt16
    */
    operator func [](a:This,b:This):UInt16
// operator ** is illegal
    operator func *(a:This,b:This):UInt16
    operator func /(a:This,b:This):UInt16
    operator func %(a:This,b:This):UInt16
// operator *& is illegal
    operator func +(a:This,b:This):UInt16
    operator func -(a:This,b:This):UInt16
    operator func <<(a:This,b:This):UInt16
    operator func >>(a:This,b:This):UInt16
    operator func <(a:This,b:This):UInt16
    operator func <=(a:This,b:This):UInt16
    operator func >(a:This,b:This):UInt16
    operator func >=(a:This,b:This):UInt16
    operator func ==(a:This,b:This):UInt16
    operator func !=(a:This,b:This):UInt16
    operator func &(a:This,b:This):UInt16
    operator func ^(a:This,b:This):UInt16
    operator func |(a:This,b:This):UInt16
//     operator func ^^(a:This,b:This):UInt16
// operator +& is illegal
// operator -& is illegal

}

append<T> A<T> with update {
    operator func !(a:A<T>):UInt16 {return 0}
//    operator func +(a:A<T>):UInt16 {return 0}
    operator func -(a:A<T>):UInt16 {return 0}
    /*
    operator func ++(a:A<T>):UInt16 {return 0}
    operator func --(a:A<T>):UInt16 {return 0}
    */
    operator func [](a:A<T>,b:A<T>):UInt16 {return 0}
// operator ** is illegal
    operator func *(a:A<T>,b:A<T>):UInt16  {return 0}
    operator func /(a:A<T>,b:A<T>):UInt16  {return 0}
    operator func %(a:A<T>,b:A<T>):UInt16  {return 0}
// operator *& is illegal
    operator func +(a:A<T>,b:A<T>):UInt16  {return 0}
    operator func -(a:A<T>,b:A<T>):UInt16  {return 0}
    operator func <<(a:A<T>,b:A<T>):UInt16 {return 0}
    operator func >>(a:A<T>,b:A<T>):UInt16 {return 0}
    operator func <(a:A<T>,b:A<T>):UInt16  {return 0}
    operator func <=(a:A<T>,b:A<T>):UInt16 {return 0}
    operator func >(a:A<T>,b:A<T>):UInt16  {return 0}
    operator func >=(a:A<T>,b:A<T>):UInt16 {return 0}
    operator func ==(a:A<T>,b:A<T>):UInt16 {return 0}
    operator func !=(a:A<T>,b:A<T>):UInt16 {return 0}
    operator func &(a:A<T>,b:A<T>):UInt16  {return 0}
    operator func ^(a:A<T>,b:A<T>):UInt16  {return 0}
    operator func |(a:A<T>,b:A<T>):UInt16  {return 0}
//     operator func ^^(a:A<T>,b:A<T>):UInt16 {return 0}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    var result : Array<UInt16> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
