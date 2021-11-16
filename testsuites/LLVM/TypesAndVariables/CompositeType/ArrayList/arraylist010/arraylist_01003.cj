// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var l : Int64 = 10
    func x(input:Int64):Int64{input}
    var a : ArrayList<Int64> = ArrayList<Int64>(l)
    var b : ArrayList<Int64> = ArrayList<Int64>(0)
    a.add(1)

    var s_1 = a.size()

    a.addAll(0,b)

    var s_2 = a.size()
    if (s_2 - s_1 != b.size()) {
        return 11
    }
    return a.get(0) - 1
}