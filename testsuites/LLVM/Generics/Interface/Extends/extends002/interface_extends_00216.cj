// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface A<T>{}

interface C <: A<Int32> & A<Int32>{} // EXPECTED: regex interface 'C' inherits or implements duplicate interface 'A'

func main(){
return 0
}
