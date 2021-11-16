// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!success!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}

class B{var a = A()}

func main() {
    try (a = A())
    {
        B().a
    } catch (_) {
        B().a
    } finally {
        B().a
    }
    print("success!\n")
    return 0
}
