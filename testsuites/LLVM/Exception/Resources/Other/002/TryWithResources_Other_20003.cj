// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan A!success!

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}

var x = ArrayList<Int64>(10)

func main() {
    x[try(a : A = A()){0}] = 1
    print("success!\n")
    return 0
}
