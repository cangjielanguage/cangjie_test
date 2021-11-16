// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-3: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!close!close!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}



func main() {
    try (a = A())
    {
        try(b = A()){return 1}
    } catch (_) {
        try(b = A()){return 2}
    } finally {
        try(b = A()){return 3}
    }
    print("success!\n")
    return 0
}
