// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A!success!

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}

var x = {i:Int64 =>}

func main() {
    try(a : A = A()){0} |> x
    print("success!\n")
    return 0
}
