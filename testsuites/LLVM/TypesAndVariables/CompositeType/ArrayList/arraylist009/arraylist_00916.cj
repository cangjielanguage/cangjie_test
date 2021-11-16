// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int64 = 20
    func x(input:Int64):Int64{input}
    var b : ArrayList<Int64> = ArrayList<Int64>(a,x)
    b.removeAt(0)

    var s_1 = b.size()
    var v_1 = b.version()

    b.add(1)
    
    var s_2 = b.size()
    var v_2 = b.version()
    if (s_1 != s_2 - 1) {
        return 1
    }
    if (v_1 != v_2 - 1) {
        return 2
    }

    return 0
}