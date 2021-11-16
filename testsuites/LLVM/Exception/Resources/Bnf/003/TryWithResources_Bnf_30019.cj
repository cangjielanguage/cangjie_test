// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!close!close!success!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}



func main() {
    try (a = A())
    {
        try(b = A()){A();()}
    } catch (_) {
        try(b = A()){A();()}
    } finally {
        try(b = A()){A();()}
    }
    print("success!\n")
    return 0
}
