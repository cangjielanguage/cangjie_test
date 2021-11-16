// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Exception

class A <: Resource {
    func isClosed(){true}
    func close(){throw Exception()}
}


func main() {
    var a = quote($(try(a : A = A()){1}))
    a.dump()
    print("success!\n")
    return 0
}
