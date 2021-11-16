// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Array<bigInt> = [1].toArray()
    var b : ArrayList<bigInt> = ArrayList<bigInt>(a)
    return b.size() - 1
}