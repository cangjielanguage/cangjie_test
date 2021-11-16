// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Array<Bool> = [true].toArray()
    var b : ArrayList<Bool> = ArrayList<Bool>(a)
    return b.size() - 1
}