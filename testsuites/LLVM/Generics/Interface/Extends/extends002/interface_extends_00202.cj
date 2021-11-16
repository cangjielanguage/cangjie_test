// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A<T>{}
interface B<T>{}

interface C<X> <: A<X> & B<Y>{} // EXPECTED: regex-auto undeclared type name 'Y'



func main(){
return 0
}
