// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

enum A{a(Int64)}
interface I<X>
where X<:A{}
func main(){return 0}
