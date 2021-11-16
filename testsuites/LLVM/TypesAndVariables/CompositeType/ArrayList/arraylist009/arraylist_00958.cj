// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int64 = 10
    var b : ArrayList<Int64> = ArrayList<Int64>(a)
    for (i in 0..9) {
        b.add(i)
    }
    var c_1 = b.size()
    if (c_1 != 9) {
        return 1
    }
    b.reserve(1)

    var c_2 = b.size()
    if (c_2 != 9) {
        return 2
    }
    return 0
}