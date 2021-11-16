// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!success!

class A<T> <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}



func main() {
    try (a = A<Int64>())
    {
        A<Int64>()
    } catch (_) {
        A<Int64>()
    } finally {
        A<Int64>()
    }
    print("success!\n")
    return 0
}
