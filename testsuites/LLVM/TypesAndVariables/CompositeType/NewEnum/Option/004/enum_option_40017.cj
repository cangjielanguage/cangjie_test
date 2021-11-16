// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var x = {a:Int64=>a}
    let c1 : ?(Int64)->Int64 = x
    var res : ?Int64 = c1?(0)
    return res ?? 1
}
