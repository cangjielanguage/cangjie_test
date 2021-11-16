// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ConcurrentModificationException

func main(): Int64 {
    let a : Int64 = 10
    func x(input:Int64):Int64{1}
    let b : ArrayList<Int64> = ArrayList<Int64>(a,x)
    func f(input:Int64){
        b.removeAt(input)
        return
    }
    b.forEach(f)
    return 0
}
