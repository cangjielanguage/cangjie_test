// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Result<?Int64> = Ok(0)
    match (a) {
        case Ok(v) => v
        case Err(_) => 1
    } ?? 2

}
