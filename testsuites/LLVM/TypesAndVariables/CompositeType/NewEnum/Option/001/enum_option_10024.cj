// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : ?Bool = true
    match (a) {
        case _ : Option<Bool> => 0
        case _ => 1
    }
}
