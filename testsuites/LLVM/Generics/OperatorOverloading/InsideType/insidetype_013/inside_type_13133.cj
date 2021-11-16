// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace



class A<X,Y>{
//operator func ~(a:A<X,X>):Bool {true}
//operator func !(a:A<X,X>):Bool {true}
//operator func +(a:A<X,X>):Bool {true}
//operator func -(a:A<X,X>):Bool {true}
operator func ++(a:A<X,X>):Bool {true}
operator func --(a:A<X,X>):Bool {true}
operator func [](b:A<Option<X>,Option<X>>):Bool {true}
operator func *(b:A<Option<X>,Option<X>>):Bool {true}
operator func /(b:A<Option<X>,Option<X>>):Bool {true}
operator func %(b:A<Option<X>,Option<X>>):Bool {true}
// operator *& is illegal
operator func +(b:A<Option<X>,Option<X>>):Bool {true}
operator func -(b:A<Option<X>,Option<X>>):Bool {true}
operator func <<(b:A<Option<X>,Option<X>>):Bool {true}
operator func >>(b:A<Option<X>,Option<X>>):Bool {true}
operator func <(b:A<Option<X>,Option<X>>):Bool {true}
operator func <=(b:A<Option<X>,Option<X>>):Bool {true}
operator func >(b:A<Option<X>,Option<X>>):Bool {true}
operator func >=(b:A<Option<X>,Option<X>>):Bool {true}
operator func ==(b:A<Option<X>,Option<X>>):Bool {true}
operator func !=(b:A<Option<X>,Option<X>>):Bool {true}
operator func &(b:A<Option<X>,Option<X>>):Bool {true}
operator func ^(b:A<Option<X>,Option<X>>):Bool {true}
operator func |(b:A<Option<X>,Option<X>>):Bool {true}
// operator func ^^(b:A<Option<X>,Option<X>>):Bool {true}
// operator +& is illegal
// operator -& is illegal
}



func main(): Int64 {
var a : A<Option<Int32>,Option<Int32>> = A<Option<Int32>,Option<Int32>>()
var b : A<Option<Int32>,Option<Int32>> = A<Option<Int32>,Option<Int32>>()
return 0
}
