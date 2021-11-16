// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a = {i:Int64=>i}
    let x = {i:Int64=>a}
    let y = {i:Int64=>x}
    let c1 : ?(Int64)->((Int64)->((Int64)->Int64)) = y
    var r1 : ?(Int64)->((Int64)->Int64) = c1?(0)
    var r2 : ?(Int64)->Int64 = r1?(0)
    var r3 : ?Int64 = r2?(0)
    return r3 ?? 1
}
