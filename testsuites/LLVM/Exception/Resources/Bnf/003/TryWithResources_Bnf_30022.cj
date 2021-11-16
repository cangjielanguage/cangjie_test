// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}



func main() {

    while (false){
        try (a = A())
        {
            continue
        } catch (_) {
            continue
        } finally {
            continue
        }
    }
    print("success!\n")
    return 0
}
