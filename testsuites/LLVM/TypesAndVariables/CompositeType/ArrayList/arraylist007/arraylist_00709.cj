// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Array<UInt64> = [UInt64(1)].toArray()
    var b : ArrayList<UInt64> = ArrayList<UInt64>(a)
    return b.size() - 1
}