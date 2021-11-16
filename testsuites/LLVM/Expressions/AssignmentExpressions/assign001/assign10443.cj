// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var l_a : Array<Unit> = @{()}
    var r_a : Int32 = 1
    l_a[0] = match (r_a) {case _ => ()}
    if (l_a[0] == ()) {
        return 0
    }
    return 1
}
