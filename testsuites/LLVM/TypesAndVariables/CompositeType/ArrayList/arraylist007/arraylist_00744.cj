// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Array<Range<Int64>> = [1..10].toArray()
    var b : ArrayList<Range<Int64>> = ArrayList<Range<Int64>>(a)
    return b.size() - 1
}