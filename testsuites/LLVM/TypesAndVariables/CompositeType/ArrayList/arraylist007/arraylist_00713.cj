// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    //var a : Array<Unit> = [()].toArray()
    var a : Array<Unit> = @{()}
    var b : ArrayList<Unit> = ArrayList<Unit>(a)
    return b.size() - 1
}