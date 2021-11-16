// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type mytype = ArrayList<Unit>

func main(): Int64 {
    var a : mytype = ArrayList<Unit>(10)
    return 0
}