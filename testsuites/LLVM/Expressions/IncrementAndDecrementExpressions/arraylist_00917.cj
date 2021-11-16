// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int64 = 20
    func x(input:Int64):Int64{input}
    a--
    a++
    var b : ArrayList<Int64> = ArrayList<Int64>(a,x)

    a--
    a++
    var s_1 = b.size()
    a--
    a++
    var v_1 = b.version()

    a--
    a++
    b.add(1)
    
    a--
    a++
    var s_2 = b.size()
    a--
    a++
    var v_2 = b.version()
    s_2--
    s_2++
    s_1--
    s_1++
    if (s_1 != s_2 - 1) {
        return 1
    }
    v_1--
    v_1++
    if (v_1 != v_2 - 1) {
        return 2
    }

    return 0
}