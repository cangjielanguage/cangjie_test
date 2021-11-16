// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A!A!success!

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}

var x = {i:Int64 =>i}

func main() {
    try(a : A = A()){x} ~> try(a : A = A()){x}
    print("success!\n")
    return 0
}
