// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success!

class A <: Resource {
    func isClosed(){true}
    func close(){throw Exception()}
}

var m = Mutex()
func main() {
    synchronized(try(a : A = A()){m}){try(a : A = A()){m}}
    print("success!\n")
    return 0
}
