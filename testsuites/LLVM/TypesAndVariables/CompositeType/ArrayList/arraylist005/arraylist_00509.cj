// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var a : ArrayList<Unit> = ArrayList<Unit>(10)
    var b : Array<ArrayList<Unit>> = @{a}
    return 0
}