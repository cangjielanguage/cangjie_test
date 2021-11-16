// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var l_a : Unit = ()
    
    l_a = do {} while (false)
    if (l_a == ()) {
        return 0
    }
    return 1
}
