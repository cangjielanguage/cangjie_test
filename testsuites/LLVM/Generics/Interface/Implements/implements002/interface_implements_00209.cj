// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface I<T>{
    func foo(a:T):Int32{return Int32(1)}
}

interface J<T>{
    func foo(a:T):Bool{return true}
}

open external class A<T>{}

external class B<X,Y,Z> <: A<Int32> & I<Int8> &J<Int8>{
    func foo(a:X):Bool{return true}
}


func main(){
    var a : B<Int8,Int16,Int32> = B<Int8,Int16,Int32>() // EXPECTED: regex instantiation 'B<Int8,Int16,Int32>' causes ambiguous functions named 'foo' between declaration 'B<Int8,Int16,Int32>' and declaration 'J<Int8>'
    return 0
}
