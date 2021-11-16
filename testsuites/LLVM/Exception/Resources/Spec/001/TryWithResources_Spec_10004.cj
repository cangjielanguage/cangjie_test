// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan B!success!

abstract class A <: Resource {}

class B <: A{
    func isClosed(){false}
    func close(){print("B!")}
}

func main() {
    try (a : A = B())
    {
    } finally {}
    print("success!\n")
    return 0
}
