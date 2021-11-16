// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan B!success!

open class A <: Resource {
    open func isClosed(){print("A!");true}
    open func close(){}
}

class B <: A{
    override func isClosed(){false}
    override func close(){print("B!")}
}

func main() {
    try (a : A = B())
    {
    } finally {}
    print("success!\n")
    return 0
}
