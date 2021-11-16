// DEPENDENCE: test_20029.cj
// EXEC: %compiler %cmp_opt test_20029.cj %pic_opt
// EXEC: %run %compiler %cmp_opt %macro_lib_opt %f  -o %output
// EXEC-PIPE: %run %run_opt %output  %run_args | compare %f
// ASSERT: scan try!
// ASSERT: scan close!
// ASSERT: scan success!

import test.*

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}



func main() {
    try (a = @M(A()))
    {
        print("try!\n")
    }
    print("success!\n")
    return 0
}
