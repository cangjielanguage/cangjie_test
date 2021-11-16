// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<T>{
func foo(a:T):Int32
}

interface J<T>{
func foo(a:T):Bool
}

open external class A<T>{}

external class B<X,Y,Z> <: A<Int32> & I<Int8> &J<Int8>{
func foo(a:Int8):Int32{return Int32(1)} // EXPECTED: regex function 'foo' has overload conflicts
func foo(a:Int8):Bool{return true} // EXPECTED: regex function 'foo' has overload conflicts
}


func main(){
var a : B<Int8,Int16,Int32> = B<Int8,Int16,Int32>()
return 0
}
