// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


enum E{
|e(Int64)
|e(Int64,Int64)
}

var e = {}

func main(): Int64 {
    e()
    //e(1)
    //e(1,1)
    return 0
}
