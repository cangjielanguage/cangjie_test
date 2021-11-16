// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A!success!

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}

func main() {
    var a : Int64 = try (a : A = A())
    {
        0
    } finally {true}
    print("success!\n")
    return a
}
