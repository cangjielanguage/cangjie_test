// EXEC: %compiler %cmp_opt %f -o %output
// ERRCHECK: %run %run_opt %output %run_args
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func main(): Int64 {
    var l : Int64 = 6148914691236517206 // a*1.5 = MAX_INT64 + 2
    func x(input:Int64):Int64{input}
    var a : ArrayList<Int64> = ArrayList<Int64>(l,x)
    var b : ArrayList<Int64> = ArrayList<Int64>(1,x)

    a.addAll(1,b) // OVER FLOW!

    return 1
}
