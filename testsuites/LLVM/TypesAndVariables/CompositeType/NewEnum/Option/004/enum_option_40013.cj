// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var x : ?Unit = ()
    let c1 = Option<Unit>.Some(())
    var y = x ?? ()
    return 0
}
