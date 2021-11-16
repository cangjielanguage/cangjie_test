// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    func x(input:Int64):Int64{input}
    //var a : Array<((Int64)->Int64)> = [x].toArray()
    var a : Array<((Int64)->Int64)> = @{x}
    var b : ArrayList<(Int64)->Int64> = ArrayList<(Int64)->Int64>(a)
    return b.size() - 1
}