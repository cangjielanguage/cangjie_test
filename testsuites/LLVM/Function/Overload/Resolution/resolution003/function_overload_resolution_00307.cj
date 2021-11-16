// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class A{}
open class C <: A{}
open class E <: C{}

open class B{}
open class D <: B{}
open class F <: D{}

func test(a:A*D):Int64{return 1}
func test(a:C*B):Int64{return 2}

func main(){
    test((E(),F())) // EXPECTED: regex ambiguous match for function call
    return 1
}