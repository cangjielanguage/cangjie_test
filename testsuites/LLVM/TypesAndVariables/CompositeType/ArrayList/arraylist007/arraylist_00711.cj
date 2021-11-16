// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Array<String> = ["1"].toArray()
    var b : ArrayList<String> = ArrayList<String>(a)
    return b.size() - 1
}