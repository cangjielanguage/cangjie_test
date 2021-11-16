// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A<T>{}

class B<X> <: A<T>{} // EXPECTED: regex undeclared type name 'T'

func main(){
B<Int64>()
return 0
}
