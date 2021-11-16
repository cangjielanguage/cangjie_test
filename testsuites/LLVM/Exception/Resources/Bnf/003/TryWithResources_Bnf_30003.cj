// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!success!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}

var x : ?A = None<A>

func main() {
    try (a = A())
    {
        x??A()
    } catch (_) {
        x??A()
    } finally {
        x??A()
    }
    print("success!\n")
    return 0
}
