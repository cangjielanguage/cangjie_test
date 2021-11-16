// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!success!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}



func main() {
    try (a = A())
    {
        1 is Int64
    } catch (_) {
        1 is Int64
    } finally {
        1 is Int64
    }
    print("success!\n")
    return 0
}
