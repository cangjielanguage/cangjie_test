// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

enum E<X>{e(X)}

interface A<X,Y>{
//operator func ~(a:A<X,X>):Bool {true}
//operator func !(a:A<X,X>):Bool {true}
//operator func +(a:A<X,X>):Bool {true}
//operator func -(a:A<X,X>):Bool {true}
operator func ++(a:A<X,X>):Bool {true}
operator func --(a:A<X,X>):Bool {true}
operator func [](b:A<E<X>,E<X>>):Bool {true}
operator func *(b:A<E<X>,E<X>>):Bool {true}
operator func /(b:A<E<X>,E<X>>):Bool {true}
operator func %(b:A<E<X>,E<X>>):Bool {true}
// operator *& is illegal
operator func +(b:A<E<X>,E<X>>):Bool {true}
operator func -(b:A<E<X>,E<X>>):Bool {true}
operator func <<(b:A<E<X>,E<X>>):Bool {true}
operator func >>(b:A<E<X>,E<X>>):Bool {true}
operator func <(b:A<E<X>,E<X>>):Bool {true}
operator func <=(b:A<E<X>,E<X>>):Bool {true}
operator func >(b:A<E<X>,E<X>>):Bool {true}
operator func >=(b:A<E<X>,E<X>>):Bool {true}
operator func ==(b:A<E<X>,E<X>>):Bool {true}
operator func !=(b:A<E<X>,E<X>>):Bool {true}
operator func &(b:A<E<X>,E<X>>):Bool {true}
operator func ^(b:A<E<X>,E<X>>):Bool {true}
operator func |(b:A<E<X>,E<X>>):Bool {true}
// operator func ^^(b:A<E<X>,E<X>>):Bool {true}
// operator +& is illegal
// operator -& is illegal
}

class A_B<X,Y> <: A<X,Y>{}

func main(): Int64 {
var a : A<E<Int32>,E<Int32>> = A_B<E<Int32>,E<Int32>>()
var b : A<Int32,Int32> = A_B<Int32,Int32>()
return 0
}
