// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Exception

class A <: Resource {
    func isClosed(){true}
    func close(){throw Exception()}
}

class B <: Throwable{}

func main() {
    throw try(a : A = A()){B()}
    print("success!\n")
    return 0
}
