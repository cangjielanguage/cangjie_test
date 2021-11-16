// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Set<Int64>[] = [#{1}].toArray()
    var b : ArrayList<Set<Int64>> = ArrayList<Set<Int64>>(a)
    return b.size() - 1
}