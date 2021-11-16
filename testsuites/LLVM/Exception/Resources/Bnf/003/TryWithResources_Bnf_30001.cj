// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!success!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}

func foo(x:Int64){A()}

func main() {
    try (a = A())
    {
        1|>foo
    } catch (_) {
        1|>foo
    } finally {
        1|>foo
    }
    print("success!\n")
    return 0
}
