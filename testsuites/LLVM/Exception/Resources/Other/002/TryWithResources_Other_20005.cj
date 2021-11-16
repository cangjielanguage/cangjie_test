// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A!success!

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}

var x = {i:Int64 =>}

func main() {
    1 |> try(a : A = A()){x}
    print("success!\n")
    return 0
}
