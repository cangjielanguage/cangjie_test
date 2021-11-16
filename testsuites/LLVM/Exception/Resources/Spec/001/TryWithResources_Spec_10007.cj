// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan B!success!

interface A<T> <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}

class B <: A<Int64>{
    func isClosed(){false}
    func close(){print("B!")}
}

func main() {
    try (a : A<Int64> = B())
    {
    } finally {}
    print("success!\n")
    return 0
}
