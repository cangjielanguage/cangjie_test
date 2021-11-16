// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    //var a : Array<UInt8> = [UInt8(1)].toArray()
    var a : Array<UInt8> = [UInt8(1)].toArray()
    var b : ArrayList<UInt8> = ArrayList<UInt8>(a)
    return b.size() - 1
}