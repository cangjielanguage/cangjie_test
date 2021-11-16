// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan close!
// ASSERT: scan Exception
// ASSERT: scan-not success!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}

class B <: Throwable{}

func main() {
    var flag = true
    while (true){
        try (a = A())
        {
            throw B()
        }
        finally {
            throw Exception()
        }
    }
    print("success!\n")
    return 0
}
