// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var a : ArrayList<Unit> = ArrayList<Unit>(10)

func main(): Int64 {
    if (a.isEmpty()) {
        return 0
    }
    return 1
}