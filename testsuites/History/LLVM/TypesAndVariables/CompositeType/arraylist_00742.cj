// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Map<Int64,Int64>[] = [#{1:1}].toArray()
    var b : ArrayList<Map<Int64,Int64>> = ArrayList<Map<Int64,Int64>>(a)
    return b.size() - 1
}