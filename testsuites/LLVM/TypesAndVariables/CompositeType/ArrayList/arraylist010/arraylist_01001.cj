// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 

func main(): Int64 {
    var l : Int64 = 10
    func x(input:Int64):Int64{input}
    var a : ArrayList<Int64> = ArrayList<Int64>(l)
    var b : ArrayList<Int64> = ArrayList<Int64>(l,x)
    a.addAll(0,b)
    return 0
}
