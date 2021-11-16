// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!success!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}

func main() {
    var flag = true
    while (true){
        try (a = A())
        {
            throw Exception()
        }
        finally {
            if (flag){
                flag = false
                continue
            }
            break
        }
    }
    print("success!\n")
    return 0
}
