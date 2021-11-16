// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<I>{
func t(a:I):I
}

class A <: I<Int32> {
func t(a:I):I{a} // EXPECTED: regex generic type should be used with type argument
}

func main(){
A()
return 0
}
