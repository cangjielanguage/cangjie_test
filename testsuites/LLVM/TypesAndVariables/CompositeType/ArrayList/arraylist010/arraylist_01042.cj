// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var l : Int64 = 5
    func x(input:Int64):Int64{input}
    var a : ArrayList<Int64> = ArrayList<Int64>(l,x)

    a.reverse()
    for (i in 0..5) {
        if (a[i] != 4-i) {
            return i + 1
        }
    }

    return a[4]
}