// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{}
record B{}
trait update{
    operator func !(a:This):B
//    operator func +(a:This):B
    operator func -(a:This):B
    /*
    operator func ++(a:This):B
    operator func --(a:This):B
    */
    operator func [](a:This,b:This):B
// operator ** is illegal
    operator func *(a:This,b:This):B
    operator func /(a:This,b:This):B
    operator func %(a:This,b:This):B
// operator *& is illegal
    operator func +(a:This,b:This):B
    operator func -(a:This,b:This):B
    operator func <<(a:This,b:This):B
    operator func >>(a:This,b:This):B
    operator func <(a:This,b:This):B
    operator func <=(a:This,b:This):B
    operator func >(a:This,b:This):B
    operator func >=(a:This,b:This):B
    operator func ==(a:This,b:This):B
    operator func !=(a:This,b:This):B
    operator func &(a:This,b:This):B
    operator func ^(a:This,b:This):B
    operator func |(a:This,b:This):B
//     operator func ^^(a:This,b:This):B
// operator +& is illegal
// operator -& is illegal

}

append<T> A<T> with update {
    operator func !(a:A<T>):B {return B()}
//    operator func +(a:A<T>):B {return B()}
    operator func -(a:A<T>):B {return B()}
    /*
    operator func ++(a:A<T>):B {return B()}
    operator func --(a:A<T>):B {return B()}
    */
    operator func [](a:A<T>,b:A<T>):B {return B()}
// operator ** is illegal
    operator func *(a:A<T>,b:A<T>):B  {return B()}
    operator func /(a:A<T>,b:A<T>):B  {return B()}
    operator func %(a:A<T>,b:A<T>):B  {return B()}
// operator *& is illegal
    operator func +(a:A<T>,b:A<T>):B  {return B()}
    operator func -(a:A<T>,b:A<T>):B  {return B()}
    operator func <<(a:A<T>,b:A<T>):B {return B()}
    operator func >>(a:A<T>,b:A<T>):B {return B()}
    operator func <(a:A<T>,b:A<T>):B  {return B()}
    operator func <=(a:A<T>,b:A<T>):B {return B()}
    operator func >(a:A<T>,b:A<T>):B  {return B()}
    operator func >=(a:A<T>,b:A<T>):B {return B()}
    operator func ==(a:A<T>,b:A<T>):B {return B()}
    operator func !=(a:A<T>,b:A<T>):B {return B()}
    operator func &(a:A<T>,b:A<T>):B  {return B()}
    operator func ^(a:A<T>,b:A<T>):B  {return B()}
    operator func |(a:A<T>,b:A<T>):B  {return B()}
//     operator func ^^(a:A<T>,b:A<T>):B {return B()}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    var result : B[] = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
