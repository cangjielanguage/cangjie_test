// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : ?Unit = ()
    match (a) {
        case _ : Option<Unit> => 0
        case _ => 1
    }
}
