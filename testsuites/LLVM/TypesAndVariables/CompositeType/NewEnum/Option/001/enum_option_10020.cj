// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : ?Float64 = 100.0
    let ret = match (a) {
        case _ : Option<Float64> => 0.0
        case _ => 1.0
    }
    if (ret == 0.0) {
        return 0
    }
    return 1
}
