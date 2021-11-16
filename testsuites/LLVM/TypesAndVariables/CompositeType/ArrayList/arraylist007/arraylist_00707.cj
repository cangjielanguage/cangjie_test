// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Array<UInt32> = [UInt32(1)].toArray()
    var b : ArrayList<UInt32> = ArrayList<UInt32>(a)
    return b.size() - 1
}