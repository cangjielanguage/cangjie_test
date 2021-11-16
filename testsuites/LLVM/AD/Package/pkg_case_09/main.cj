// DEPENDENCE: pkg
// EXEC:%compiler %cmp_opt  %enableAD -c pkg/pkg_A.cj -o pkg_A.%middle 2>&1 | compare %f
// ASSERT: scan The primal function for function adjoint_goo is not found
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import pkg_A.*
import pkg_B.*

func testStage1()
{
    var x: Float64 = 2.0
    var foo_dx1 = grad(foo, x) 
    print("foo_dx1 = ${foo_dx1}")
    var goo_dx1 = grad(goo, x) 
    print("goo_dx1 = ${goo_dx1}")
}

func main(): Int64 {
    testStage1()
    0
}
