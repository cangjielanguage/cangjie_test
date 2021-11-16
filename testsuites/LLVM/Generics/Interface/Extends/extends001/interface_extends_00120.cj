// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface A<X>{}

class B <: A{} // EXPECTED: regex-auto generic type should be used with type argument

func main(){
var a : A // EXPECTED: regex-auto generic type should be used with type argument
return 0
}
