// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class A{}
open class D <: A{}
open class G <: D{}

open class B{}
open class E <: B{}
open class H <: E{}

open class C{}
open class F <: C{}
open class I <: F{}

func test(a:A*H*I):Int64{return 1}
func test(a:G*B*I):Int64{return 2}
func test(a:G*H*C):Int64{return 3}

func main(){
    test((G(),H(),I()))  // EXPECTED: regex ambiguous match for function call
    return 1
}