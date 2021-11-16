// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int64 = 10
    func x(input:Int64):Int64{input}
    var b : ArrayList<Int64> = ArrayList<Int64>(a,x)
    var s_1 = b.size()
    if (s_1 != 10) {
        return 1
    }
    b.reserve(1)

    var s_2 = b.size()
    if (s_2 != 10) {
        return 2
    }
    return 0
}