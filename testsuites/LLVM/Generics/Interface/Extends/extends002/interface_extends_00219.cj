// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface A<T> <: A<T>{} // EXPECTED: regex-auto illegal inheritance with same identifier 'A'

func main(){
return 0
}
