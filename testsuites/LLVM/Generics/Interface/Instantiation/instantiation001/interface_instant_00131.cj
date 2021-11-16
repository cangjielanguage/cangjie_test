// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface A<X,Y>{}

func main(){
var i : A<Int32> // EXPECTED: regex type argument's number does not match type parameter's number
return 0
}
