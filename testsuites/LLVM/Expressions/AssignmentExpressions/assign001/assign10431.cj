// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var l_a : Unit = ()
    var r_a : Array<Int32> = @{1}
    l_a = for (i in r_a) {true}
    if (l_a == ()) {
        return 0
    }
    return 1
}
