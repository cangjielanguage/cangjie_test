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
        {A()}()
    } catch (_) {
        {A()}()
    } finally {
        {A()}()
    }
    print("success!\n")
    return 0
}
