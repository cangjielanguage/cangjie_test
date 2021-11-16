// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int64 = 10
    func x(input:Int64):Int64{input}
    var b : ArrayList<Int64> = ArrayList<Int64>(a)

    var c_1 = b.size()
    if (c_1 != 0) {
        return 1
    }
    b.reserve(-1)

    var c_2 = b.size()
    if (c_2 != 0) {
        return 2
    }
    return 0
}