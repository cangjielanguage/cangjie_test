// DEPENDENCE: test_30029.cj
// EXEC: %compiler %cmp_opt test_30029.cj %pic_opt
// EXEC: %run %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC-PIPE: %run %run_opt %output  %run_args | compare %f
// ASSERT: scan close!success!

import test.*

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}



func main() {
    try (a = A())
    {
        @M(A())
    } catch (_) {
        @M(A())
    } finally {
        @M(A())
    }
    print("success!\n")
    return 0
}
