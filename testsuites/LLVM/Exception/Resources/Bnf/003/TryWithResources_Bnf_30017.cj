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
        try(b = A()){b;()}
    } catch (_) {
        try(b = A()){b;()}
    } finally {
        try(b = A()){b;()}
    }
    print("success!\n")
    return 0
}
