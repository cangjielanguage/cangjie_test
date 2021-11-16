// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func item(x:(Int64)->Int64){x(100)}

func main(): Int64 {
    let c1 : ?((Int64)->Int64)->Int64 = item
    let r1 = c1?{a:Int64=>a}
    let res = r1 ?? 0
    return res - 100
}
