// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    //var a : Array<Option<Int64>> = [Option<Int64>.Some(1)].toArray()
    var a : Array<Option<Int64>> = @{Option<Int64>.Some(1)}
    var b : ArrayList<Option<Int64>> = ArrayList<Option<Int64>>(a)
    return b.size() - 1
}