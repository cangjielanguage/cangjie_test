// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Array<Int32> = [Int32(1)].toArray()
    var b : ArrayList<Int32> = ArrayList<Int32>(a)
    return b.size() - 1
}