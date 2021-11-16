// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var a : Int64 = 61
    func x(input:Int64):Int64{input}
    var b : ArrayList<Int64> = ArrayList<Int64>(a,x)
    b.add(1,1)
    if ( b.get(1) == 1 ) {
        return 0
    }
    return 1
}
