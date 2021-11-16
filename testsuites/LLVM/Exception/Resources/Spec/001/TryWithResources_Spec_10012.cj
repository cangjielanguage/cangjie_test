// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan B!success!

abstract class A<T> <: Resource {}

class B <: A<Bool>{
    func isClosed(){false}
    func close(){print("B!")}
}

func main() {
    try (a : A<Bool> = B())
    {
    } finally {}
    print("success!\n")
    return 0
}
