// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A{
class B{}
}
interface I<X>
where X<:A.B{}
func main(){return 0}
