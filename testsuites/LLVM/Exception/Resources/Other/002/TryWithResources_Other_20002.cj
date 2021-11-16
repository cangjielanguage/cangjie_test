// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A!success!

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}

let a : Int64 = try (a : A = A()){0}

func main() {
    print("success!\n")
    return a
}
