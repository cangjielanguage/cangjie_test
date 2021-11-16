// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex-not cot dumped

class A<T>{
var a : T
func test(a:T){return 1}
func x(a:T){
func test(input:T){return 2}
var I = test(a)
return I
}
}


func main():Int64{
var I = A<Int32>.x(1)
if (I != 2) {
return 1
}
return 0
}
