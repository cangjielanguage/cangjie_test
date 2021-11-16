// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!success!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}

class B{var a = A()}
var x : ?B = B()

func main() {
    try (a = A())
    {
        x?.a??A()
    } catch (_) {
        x?.a??A()
    } finally {
        x?.a??A()
    }
    print("success!\n")
    return 0
}
