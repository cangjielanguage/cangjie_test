// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan try!
// ASSERT: scan close!
// ASSERT: scan success!

class A<T> <: Resource {
    func isClosed(){false}
    func close(){print("close!")}
}



func main() {
    try (a = A<Int64>())
    {
        print("try!\n")
    }
    print("success!\n")
    return 0
}
