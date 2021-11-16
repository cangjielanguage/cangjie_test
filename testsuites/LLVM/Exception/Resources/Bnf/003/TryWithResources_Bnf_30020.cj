// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-3: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}



func main() {
    try (a = A())
    {
        return 1
    } catch (_) {
        return 2
    } finally {
        return 3
    }
    print("success!\n")
    return 0
}
