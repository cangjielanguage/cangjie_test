// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!success!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}

var x = 0

func main() {
    try (a = A())
    {
        x++
    } catch (_) {
        x++
    } finally {
        x++
    }
    print("success!\n")
    return 0
}
