// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var l : Int64 = 10
    func x(input:Int64):Int64{input}
    var a : ArrayList<Int64> = ArrayList<Int64>(l,x)
    var b : ArrayList<Int64> = ArrayList<Int64>(l,x)
    for (i in 0..5) {
        a.removeAt(0)
        b.removeAt(0)
    }
    b.add(10)
    var s_1 = a.size()
    if (s_1 != 5) {
        return 1
    }
    var v_1 = a.version()

    a.addAll(b)


    var s_2 = a.size()
    if (s_2 != 11) {
        return 1
    }
    var v_2 = a.version()

    if (s_2 - s_1 != b.size()) {
        return 11
    }
    if (v_2 - v_1 != 1) {
        return 13
    }
    return 0
}