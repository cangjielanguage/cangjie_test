// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{}

trait update{
    operator func !(a:This):Bool
//    operator func +(a:This):Bool
    operator func -(a:This):Bool
    /*
    operator func ++(a:This):Bool
    operator func --(a:This):Bool
    */
    operator func [](a:This,b:This):Bool
// operator ** is illegal
    operator func *(a:This,b:This):Bool
    operator func /(a:This,b:This):Bool
    operator func %(a:This,b:This):Bool
// operator *& is illegal
    operator func +(a:This,b:This):Bool
    operator func -(a:This,b:This):Bool
    operator func <<(a:This,b:This):Bool
    operator func >>(a:This,b:This):Bool
    operator func <(a:This,b:This):Bool
    operator func <=(a:This,b:This):Bool
    operator func >(a:This,b:This):Bool
    operator func >=(a:This,b:This):Bool
    operator func ==(a:This,b:This):Bool
    operator func !=(a:This,b:This):Bool
    operator func &(a:This,b:This):Bool
    operator func ^(a:This,b:This):Bool
    operator func |(a:This,b:This):Bool
    // operator func ^^(a:This,b:This):Bool
// operator +& is illegal
// operator -& is illegal

}

append<T> A<T> with update {
    operator func !(a:A<T>):Bool {return true}
//    operator func +(a:A<T>):Bool {return true}
    operator func -(a:A<T>):Bool {return true}
    /*
    operator func ++(a:A<T>):Bool {return true}
    operator func --(a:A<T>):Bool {return true}
    */
    operator func [](a:A<T>,b:A<T>):Bool {return true}
// operator ** is illegal
    operator func *(a:A<T>,b:A<T>):Bool  {return true}
    operator func /(a:A<T>,b:A<T>):Bool  {return true}
    operator func %(a:A<T>,b:A<T>):Bool  {return true}
// operator *& is illegal
    operator func +(a:A<T>,b:A<T>):Bool  {return true}
    operator func -(a:A<T>,b:A<T>):Bool  {return true}
    operator func <<(a:A<T>,b:A<T>):Bool {return true}
    operator func >>(a:A<T>,b:A<T>):Bool {return true}
    operator func <(a:A<T>,b:A<T>):Bool  {return true}
    operator func <=(a:A<T>,b:A<T>):Bool {return true}
    operator func >(a:A<T>,b:A<T>):Bool  {return true}
    operator func >=(a:A<T>,b:A<T>):Bool {return true}
    operator func ==(a:A<T>,b:A<T>):Bool {return true}
    operator func !=(a:A<T>,b:A<T>):Bool {return true}
    operator func &(a:A<T>,b:A<T>):Bool  {return true}
    operator func ^(a:A<T>,b:A<T>):Bool  {return true}
    operator func |(a:A<T>,b:A<T>):Bool  {return true}
//     operator func ^^(a:A<T>,b:A<T>):Bool {return true}
// operator +& is illegal
// operator -& is illegal
}

func main(): Int64 {
    var a : A<Int32> = A<Int32>()
    var b : A<Int32> = A<Int32>()
    var result : Array<Bool> = @{b[a],b*a,b/a,b%a,b+a,b-a,b<<a,b>>a,b<a,b<=a,
    b>a,b>=a,b==a,b!=a,b&a,b^a,b|a,!b,!b,-b}
    return 0
}
