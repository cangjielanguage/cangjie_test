// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A<T> <: C<T>{}    // EXPECTED: regex-auto inheritance cycle detected: 'A->C->B->A'
interface B <: A<Int32>{}
interface C<T> <: B{}


func main(){
var a : C<Int32>
return 0
}
