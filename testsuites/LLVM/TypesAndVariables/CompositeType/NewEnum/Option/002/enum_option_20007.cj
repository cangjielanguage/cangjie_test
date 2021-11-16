// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var x : ?Int64 = 0
    match (x) {
        case Some(v) => v
        case _ => 1
    }
}
