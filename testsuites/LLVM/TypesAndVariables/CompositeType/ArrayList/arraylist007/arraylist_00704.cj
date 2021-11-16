// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    //var a : Array<Int16> = [Int16(1)].toArray()
    var a : Array<Int16> = @{Int16(1)}
    var b : ArrayList<Int16> = ArrayList<Int16>(a)
    return b.size() - 1
}