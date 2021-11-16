// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int64 = 10
    var b : ArrayList<Int64> = ArrayList<Int64>(a)
    var s_1 = b.size()
    var v_1 = b.version()
    func x(input:Int64){}
    b.forEach(x)
    var s_2 = b.size()
    var v_2 = b.version()
    if (s_1 != s_2) {
        return 1
    }
    if (v_1 != v_2) {
        return 2
    }

    return 0
}