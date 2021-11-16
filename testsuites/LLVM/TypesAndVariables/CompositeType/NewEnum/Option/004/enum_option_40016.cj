// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var x = {=>0}
    let c1 = Option<()->Int64>.Some(x)
    var res : ?Int64 = c1?()
    return res ?? 0
}
