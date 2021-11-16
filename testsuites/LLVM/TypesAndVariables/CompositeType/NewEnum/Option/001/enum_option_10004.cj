// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a : ? Int64 = 100

func main(): Int64 {
    match (a) {
        case _ : Option<Int64> => 0
        case _ => 1
    }
}
