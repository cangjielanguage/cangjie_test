// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!success!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}

class B{
    var x = 1
    func main() {
    try (a = A())
    {
        this.x
    } catch (_) {
        this.x
    } finally {
        this.x
    }
    print("success!\n")
    return 0
    }
}

func main() {
    return B().main()
}
