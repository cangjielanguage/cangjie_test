// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 

func main(): Int64 {
    var l : Int64 = 92
    func x(input:Int64):Int64{input}
    var a : ArrayList<Int64> = ArrayList<Int64>(l,x)
    var b : ArrayList<Int64> = ArrayList<Int64>(1,x)

    a.addAll(b)

    return 0
}
