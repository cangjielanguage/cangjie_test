// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
interface A{}
interface B{}
class C <: A &B{}

func test(a:A):Int64{return 1}
func test(a:B):Int64{return 2}

func main(){
    test(C())// EXPECTED: regex ambiguous match for function call
    return 1
}