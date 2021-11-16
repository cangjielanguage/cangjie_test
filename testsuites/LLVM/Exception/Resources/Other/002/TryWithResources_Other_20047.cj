// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success!

class A <: Resource {
    func isClosed(){true}
    func close(){throw Exception()} // will not be called.
}

func main() {
    try(a : A = A()){}
    print("success!\n")
    return 0
}
