// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<:Exception{}

func main(): Int64 {
    var a : Result<Bool> = Ok(false)
    var b : Bool = true
    var c : Bool = true
    if (a??b||c) {
        return 1
    }
    return 0
}
