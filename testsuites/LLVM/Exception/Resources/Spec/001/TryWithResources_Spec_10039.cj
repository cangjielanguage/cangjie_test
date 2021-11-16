// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A!success!

class A <: Resource{
    func isClosed(){print("A!");true}
    func close(){}
    func isClosed(x:Any):Bool{throw Exception()}
    func close(x:Any):Unit{throw Exception()}
}



func main() {
    try (x : A = A())
    {
    } finally {}
    print("success!\n")
    return 0
}
