// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan close!success!

class A <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}

open class C{var x = 1}

class B <: C{
    func main() {
    try (a = A())
    {
        super.x
    } catch (_) {
        super.x
    } finally {
        super.x
    }
    print("success!\n")
    return 0
    }
}

func main() {
    return B().main()
}
