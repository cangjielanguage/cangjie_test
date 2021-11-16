// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<T>{}
class A<T>{}
internal class B<T> <: A<T> & I<T>{} // EXPECTED: regex super class 'A' is not inheritable, use 'open' modifier instead


func main(){
var a : B<Int32>
return 0
}
