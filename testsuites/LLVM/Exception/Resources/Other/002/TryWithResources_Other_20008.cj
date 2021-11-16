// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A!A!success!

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}

func main() {
    try(a : A = A()){1} | try(a : A = A()){1}
    print("success!\n")
    return 0
}
