// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 1111111111

func main(): Int64 {
    var a : Int64 = 10
    func x(input:Int64):Int64{1}
    var b : ArrayList<Int64> = ArrayList<Int64>(a,x)
    func f(input:Int64){print(input.toString())}
    b.forEach(f)
    return 0
}