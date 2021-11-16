// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<X,Y>{
//operator func ~(a:A<X,Option<X>>):Bool {true}
//operator func !(a:A<X,Option<X>>):Bool {true}
//operator func +(a:A<X,Option<X>>):Bool {true}
//operator func -(a:A<X,Option<X>>):Bool {true}
//operator func ++():Bool {true}
//operator func --():Bool {true}
operator func [](b:A<X,Option<X>>):Bool {true}
operator func *(b:A<X,Option<X>>):Bool {true}
operator func /(b:A<X,Option<X>>):Bool {true}
operator func %(b:A<X,Option<X>>):Bool {true}
operator func +(b:A<X,Option<X>>):Bool {true}
operator func -(b:A<X,Option<X>>):Bool {true}
operator func <<(b:A<X,Option<X>>):Bool {true}
operator func >>(b:A<X,Option<X>>):Bool {true}
operator func <(b:A<X,Option<X>>):Bool {true}
operator func <=(b:A<X,Option<X>>):Bool {true}
operator func >(b:A<X,Option<X>>):Bool {true}
operator func >=(b:A<X,Option<X>>):Bool {true}
operator func ==(b:A<X,Option<X>>):Bool {true}
operator func !=(b:A<X,Option<X>>):Bool {true}
operator func &(b:A<X,Option<X>>):Bool {true}
operator func ^(b:A<X,Option<X>>):Bool {true}
operator func |(b:A<X,Option<X>>):Bool {true}
// operator func ^^(b:A<X,Option<X>>):Bool {true}
// operator +& is illegal
// operator -& is illegal
}



func main(): Int64 {
var a : A<Option<Int32>,Option<Int32>> = A<Option<Int32>,Option<Int32>>()
var b : A<Option<Int32>,Option<Int32>> = A<Option<Int32>,Option<Int32>>()
return 0
}
