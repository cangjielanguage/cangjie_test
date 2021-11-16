// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex-not cot dumped

open class A<T> {
func test(a:T,b:Int64=1){}
}
class B<T> <: A<T>{
func test(a:T){}
var x : T
func i(){
var I = test(x) // EXPECTED: regex ambiguous match for function call
return I
}
}

func main():Int64{
return 0
}
