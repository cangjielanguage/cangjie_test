// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : ?UInt16 = 100
    match (a) {
        case _ : Option<UInt16> => 0
        case _ => 1
    }
}
