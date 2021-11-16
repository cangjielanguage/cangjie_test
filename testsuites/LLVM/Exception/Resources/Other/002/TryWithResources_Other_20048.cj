// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Exception

class A <: Resource {
    func isClosed(){false}
    func close(){throw Exception()} // will be called.
}

func main() {
    try(a : A = A()){}
    print("success!\n")
    return 0
}
