// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Throwable{}

func main(): Int64 {
    var a : Result<Int64> = Err(A())
    match (a) {
        case Ok(v) => 1
        case Err(_) => 0
    }
}
