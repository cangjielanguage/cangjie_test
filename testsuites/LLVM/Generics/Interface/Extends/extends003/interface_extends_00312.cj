// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface C<X> <: C<Int32>{} // EXPECTED: regex-auto illegal inheritance with same identifier 'C'

func main(){
var a : C<Int32>
return 0
}
