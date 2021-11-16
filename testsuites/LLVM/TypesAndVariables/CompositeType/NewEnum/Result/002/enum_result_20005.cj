// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<:Exception{}

func main(): Int64 {
    var a : Result<Bool> = Err(A())
    var b : Bool = false
    var c : Bool = false
    if (a??b||c) {
        return 1
    }
    return 0
}
