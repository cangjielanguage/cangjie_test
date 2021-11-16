// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface A<X>{}

interface B <: A<>{}// EXPECTED: regex expected type argument

func main(){
var i : A<Int32>
var j : B
return 0
}
