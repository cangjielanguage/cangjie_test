// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<T>{}
class A{}
external class B <: A & I<T>{} // EXPECTED: regex super class 'A' is not inheritable, use 'open' modifier instead


func main(){
var a : B
return 0
}
