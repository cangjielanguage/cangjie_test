// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

open class Base<T> {
init(x: T){}
open func foo(x: T): String{
return "Father"
}
}

class Data<T> <: Base<T> {
init(input:T){}
override func foo(x: T=4): String{ // EXPECTED: regex type of default argument value is not match to expected type 'Generics-T'
return "Child"
}
}

func main(): Int64 {
var data: Data<Int32> = Data<Int32>()
var res: String = data.foo(3)
if(res == "Child"){
return 0
}
return 1
}
