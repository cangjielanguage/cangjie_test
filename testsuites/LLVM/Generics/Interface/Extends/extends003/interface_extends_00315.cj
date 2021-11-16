// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A<T> <: B<Int32>{}    // EXPECTED: regex inheritance cycle detected: 'A->B->A'
interface B<T> <: A<Int32>{}


func main(){
return 0
}
