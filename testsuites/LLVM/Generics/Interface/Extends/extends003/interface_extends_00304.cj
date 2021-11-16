// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A{
func foo(){}
}

interface C<X> <: A{
override func foo(a:X):X{a} // EXPECTED: regex 'override' modifier is illegal for function declaration in interface body
}

func main(){
var a : C<Int32>
return 0
}
