// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A!success!

enum A<T> <: Resource {
    a
    func isClosed(){print("A!");true}
    func close(){}
}

func main() {
    try (x : A<Bool> = A<Bool>.a)
    {
    } finally {}
    print("success!\n")
    return 0
}
