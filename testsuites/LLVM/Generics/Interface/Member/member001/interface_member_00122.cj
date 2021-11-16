// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<Y>{
func t(a:X):X{return a} // EXPECTED: regex undeclared type name 'X'
}

class A <: I<Int32> {
var a :Int32 = 1
var b = t(a)
}

func main(){
A()
return 0
}
