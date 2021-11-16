// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

interface I<T>{
static func foo(a:T):Int32{return Int32(1)}
}

interface J<T>{
static func foo(a:T):Int32{return Int32(1)}
}

open external class A<T>{}

external class B<X,Y,Z> <: A<Int32> & I<Int8> &J<Int8>{} // EXPECTED: regex function 'foo' needs to be overridden


func main(){
var a : B<Int8,Int16,Int32> = B<Int8,Int16,Int32>()
return 0
}
