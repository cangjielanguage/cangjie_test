// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    let a = {i:Int64=>i}
    let x = {i:Int64=>a}
    let y = {i:Int64=>x}
    let c1 : ?(Int64)->((Int64)->((Int64)->Int64)) = y
    var r3 : ?Int64 = c1?(0)?(0)?(0)
    return r3 ?? 1
}
