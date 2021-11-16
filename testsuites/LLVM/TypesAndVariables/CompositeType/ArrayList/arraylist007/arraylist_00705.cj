// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    //var a : Array<UInt16> = [UInt16(1)].toArray()
    var a : Array<UInt16> = @{UInt16(1)}
    var b : ArrayList<UInt16> = ArrayList<UInt16>(a)
    return b.size() - 1
}