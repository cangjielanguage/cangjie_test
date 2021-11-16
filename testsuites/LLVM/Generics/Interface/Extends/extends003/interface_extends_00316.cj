// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A<T> <: B<T>{}    // EXPECTED: regex inheritance cycle detected: 'A->B->A'
interface B<T> <: A<T>{}


func main(){
return 0
}
