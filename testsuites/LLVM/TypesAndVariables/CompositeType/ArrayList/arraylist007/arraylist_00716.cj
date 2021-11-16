// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func x<T>(input:T):T{input}
func main(): Int64 {
    //var a : Array<((Int64)->Int64)> = [x<Int64>].toArray()
    var a : Array<((Int64)->Int64)> = @{x<Int64>}
    var b : ArrayList<(Int64)->Int64> = ArrayList<(Int64)->Int64>(a)
    return b.size() - 1
}