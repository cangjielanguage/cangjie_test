// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success!

class A <: Resource {
    func isClosed(){true}
    func close(){throw Exception()}
}

var test = {a!:Int64 = try(a : A = A()){1} => a }

func main() {
    test()
    print("success!\n")
    return 0
}
