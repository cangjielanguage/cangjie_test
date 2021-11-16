// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A!success!

record A<T> <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}

func main() {
    try (a : A<Bool> = A<Bool>())
    {
    } finally {}
    print("success!\n")
    return 0
}
