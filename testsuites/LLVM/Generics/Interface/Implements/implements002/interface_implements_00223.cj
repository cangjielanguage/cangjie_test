// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<T> {}
open external class A<T> {}
external class B<T> <: A<T> & I<T> & I<Int32>{}

func main(){
var a : B<Int32> = B<Int32>() // EXPECTED: regex-auto class 'B' inherits or implements duplicate interface 'I'
return 0
}
