// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A<X,Y>{}
class B<X> <: A<X,Y>{} // EXPECTED: regex undeclared type name 'Y'

func main(){
return 0
}
