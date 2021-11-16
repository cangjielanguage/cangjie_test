// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A!success!

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
    var res = 1
}



func main() {
    var res = 1
    try (a : A = A())
    {
        a.res = 0
        res = a.res
    } finally {}
    print("success!\n")
    return res
}
