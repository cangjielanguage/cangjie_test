// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var l : Int64 = 92
    func x(input:Int64):Int64{input}
    var a : ArrayList<Int64> = ArrayList<Int64>(0)
    var b : ArrayList<Int64> = ArrayList<Int64>(l,x)
    var s_1 = a.size()
    var v_1 = a.version()

    a.addAll(b)

    var s_2 = a.size()
    var v_2 = a.version()
    if (s_2 != l) {
        return 1
    }
    if (s_2 - s_1 != b.size()) {
        return 11
    }
    if (v_2 - v_1 != 1) {
        return 13
    }
    return 0
}
