// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A<T> {}

interface B<T> <: A<T> & A<Int32> {}

func test(a: B<Int32>) {} // EXPECTED: regex-auto interface 'B' inherits or implements duplicate interface 'A'

func main(){
return 0
}
