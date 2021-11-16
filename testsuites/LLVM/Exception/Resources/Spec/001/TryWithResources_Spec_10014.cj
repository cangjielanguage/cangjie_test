// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A!success!

class A<T>{}

extend A<T> <: Resource{
    func isClosed(){print("A!");true}
    func close(){}
}


func main() {
    try (a : A<Int64> = A<Int64>())
    {
    } finally {}
    print("success!\n")
    return 0
}
