// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    //var a : Array<Int8> = [].toArray()
    var a : Array<Int8> = @{}
    var b : ArrayList<Int8> = ArrayList<Int8>(a)
    return b.size()
}