// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan close!
// ASSERT: scan Exception
// ASSERT: scan test

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}



func main() {
    try (a = A())
    {
        throw Exception("test")
    } catch (_) {
        throw Exception("test")
    } finally {
        throw Exception("test")
    }
    print("success!\n")
    return 0
}
