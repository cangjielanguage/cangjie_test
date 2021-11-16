// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A<X> {}
class B<X> <: A<X> & A<Int32> {}

func main(){
var a: A<Int32> = B<Int32>() // EXPECTED: regex-auto class 'B' inherits or implements duplicate interface 'A'
return 0
}
