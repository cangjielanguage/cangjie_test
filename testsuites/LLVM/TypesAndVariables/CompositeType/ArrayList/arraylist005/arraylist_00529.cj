// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var x : ArrayList<Unit> = ArrayList<Unit>()
    var res = match (x) {
        case _ : ArrayList<Unit> => 0
        case _ => 1
    }
    return res
}