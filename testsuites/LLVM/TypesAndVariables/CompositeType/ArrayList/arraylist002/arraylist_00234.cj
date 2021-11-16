// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type mytype = Int64

func main(): Int64 {
    func x(a:Int64):Int64{a}
    var i : Int64 = 10
    var myArray : ArrayList<mytype> = ArrayList<mytype>(i,x)
    return 0
}