// DEPENDENCE: pkg
// EXEC:%compiler %cmp_opt  %enableAD -c pkg/pkg.cj -o pkg.%middle
// EXEC:%compiler %cmp_opt %enableAD %n.cj pkg.%middle -o %n.out
// EXEC: %n.out 2>&1 | compare %f
// ASSERT: scan dx1 = 4.000000
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import pkg.*

func testStage1()
{
    var x: Float64 = 2.0
    var dx1 = grad(square, x)
    print("dx1 = ${dx1}")
}

func main(): Int64 {
    testStage1()
    0
}
