// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    func x(a:Int64):Int64{a}
    var i : Int64 = 92
    var a = ArrayList<Int64>(i,x)
    if ( a.get(91) != 91 ) {
        return 1
    }
    return 0
}
