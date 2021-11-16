// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
open class Father{
open func foo(a:Int8):Int64{return 1}

}

class Child <: Father{
private func foo(a:Int16):Int64{return 2}
}

func main(){
var i = Child()
if (i.foo(Int16(1)) != Int64(2)) { // EXPECTED: regex no matching function declaration for function call
return 1
}
return 0
}
