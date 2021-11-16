// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class Father{}
class Child <: Father{}

interface I<T>{
func foo(a:T):Father{return Father()}
}

interface J<T>{
func foo(a:T):Child{return Child()}
}

open external class A<T>{}

external class B<X,Y,Z> <: A<Int32> & I<Int8> &J<Int16>{
override func foo(a:Int16):Father{return Child()} // EXPECTED: regex The return type of the override/redefine/implement function must be the same as or a subtype of the overridden/redefined/implemented function
}


func main(){
var a : B<Int8,Int16,Int32> = B<Int8,Int16,Int32>()
return 0
}
