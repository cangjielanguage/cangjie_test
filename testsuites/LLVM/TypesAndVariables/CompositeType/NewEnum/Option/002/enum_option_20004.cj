// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    match (1) {
        case _ : ?Int64 => 1
        case _ => 0
    }
}
