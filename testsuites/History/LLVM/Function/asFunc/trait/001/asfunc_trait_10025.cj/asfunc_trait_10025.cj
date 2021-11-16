// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait C{
    func asFunc(input:This):Int64
}

append ArrayList<Int64> with C{
    func asFunc(input:ArrayList<Int64>):Int64{0}
}



func main(): Int64 {
    var a : ArrayList<Int64> = ArrayList<Int64>([1].toArray())
    return a()
}
