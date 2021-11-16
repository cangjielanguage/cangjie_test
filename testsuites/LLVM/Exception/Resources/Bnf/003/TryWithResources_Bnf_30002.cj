// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!success!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}

func foo(x:A){A()}

func main() {
    try (a = A())
    {
        A()|>(foo~>foo)
    } catch (_) {
        A()|>(foo~>foo)
    } finally {
        A()|>(foo~>foo)
    }
    print("success!\n")
    return 0
}
