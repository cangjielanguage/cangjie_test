// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int64 = 10
    func x(input:Int64):Int64{input}
    var b : ArrayList<Int64> = ArrayList<Int64>(a,x)
    b.removeAt(5)
    return b.get(5) - 6
}