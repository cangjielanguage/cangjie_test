// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
open class A{
var a : Int32 = 1
}

class B <: A{
var b : Int32
init(){
this.b = 1
}
var MyTuple = (this(),this()) // EXPECTED: regex invalid calling 'this' outside the constructor
}


func main(): Int64 {
var a = B()
return 0
}
