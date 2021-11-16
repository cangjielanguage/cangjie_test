// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A{
func foo():Unit
}

class C<X> <: A{
func foo<T>(a:X){} // EXPECTED: regex error.*?non-static generic member function 'foo' is not supported
}

func main(){
var a : C<Int32>
return 0
}
