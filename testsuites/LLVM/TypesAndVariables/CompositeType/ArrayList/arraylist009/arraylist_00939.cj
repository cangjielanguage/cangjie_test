// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int64 = 10
    func x(input:Int64):Int64{100}
    var b : ArrayList<Int64> = ArrayList<Int64>(a,x)

    b.add(8,1000)

    return b.get(8) - 1000
}