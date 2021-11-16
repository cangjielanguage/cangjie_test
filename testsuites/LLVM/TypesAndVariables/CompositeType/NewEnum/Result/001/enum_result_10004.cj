// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var i : ?Int64 = 0
    var a : Result<?Int64> = Ok(i)
    match (a) {
        case Ok(v) => v
        case Err(_) => 1
    } ?? 2

}
