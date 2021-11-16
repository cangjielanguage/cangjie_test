// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface A<X>{}
interface B <: A{} // EXPECTED: regex generic type should be used with type argument

func main(){
var a : B
return 0
}
