// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class Base<T> {
init(x: T){}
open func foo(x: T): String{
return "Father"
õõ
class Data<T> <: Base<T> {
init(input:T){}
override func foo(x: T=4): String{
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
