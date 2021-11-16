// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

enum E<X,Y>{e(X)}

record A<X,Y>{
//operator func ~(a:A<X,E<X,Y>>):Bool {true}
//operator func !(a:A<X,E<X,Y>>):Bool {true}
//operator func +(a:A<X,E<X,Y>>):Bool {true}
//operator func -(a:A<X,E<X,Y>>):Bool {true}
operator func ++(a:A<X,E<X,Y>>):Bool {true}
operator func --(a:A<X,E<X,Y>>):Bool {true}
operator func [](b:A<X,E<X,Y>>):Bool {true}
operator func *(b:A<X,E<X,Y>>):Bool {true}
operator func /(b:A<X,E<X,Y>>):Bool {true}
operator func %(b:A<X,E<X,Y>>):Bool {true}
// operator *& is illegal
operator func +(b:A<X,E<X,Y>>):Bool {true}
operator func -(b:A<X,E<X,Y>>):Bool {true}
operator func <<(b:A<X,E<X,Y>>):Bool {true}
operator func >>(b:A<X,E<X,Y>>):Bool {true}
operator func <(b:A<X,E<X,Y>>):Bool {true}
operator func <=(b:A<X,E<X,Y>>):Bool {true}
operator func >(b:A<X,E<X,Y>>):Bool {true}
operator func >=(b:A<X,E<X,Y>>):Bool {true}
operator func ==(b:A<X,E<X,Y>>):Bool {true}
operator func !=(b:A<X,E<X,Y>>):Bool {true}
operator func &(b:A<X,E<X,Y>>):Bool {true}
operator func ^(b:A<X,E<X,Y>>):Bool {true}
operator func |(b:A<X,E<X,Y>>):Bool {true}
// operator func ^^(b:A<X,E<X,Y>>):Bool {true}
// operator +& is illegal
// operator -& is illegal
}



func main(): Int64 {
var a : A<Int32,E<Int32,Int32>> = A<Int32,E<Int32,Int32>>()
var b : A<Int32,Int32> = A<Int32,Int32>()
return 0
}
