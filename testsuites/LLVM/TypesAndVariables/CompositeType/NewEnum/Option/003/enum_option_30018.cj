// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    var d : (Int64)->Int64 = {x:Int64 => x}
    var c : ?(Int64)->Int64 = Some({x:Int64 => x + 1})
    var res = c??d ~> c??d
    return res(-2)
}
