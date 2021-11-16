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
        if (true){A()}else{A()}
    } catch (_) {
        if (true){A()}else{A()}
    } finally {
        if (true){A()}else{A()}
    }
    print("success!\n")
    return 0
}
