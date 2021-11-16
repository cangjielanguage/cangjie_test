// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!success!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}

var x : ?ArrayList<A> = ArrayList<A>([A()])

func main() {
    try (a = A())
    {
        x?[0]??A()
    } catch (_) {
        x?[0]??A()
    } finally {
        x?[0]??A()
    }
    print("success!\n")
    return 0
}
