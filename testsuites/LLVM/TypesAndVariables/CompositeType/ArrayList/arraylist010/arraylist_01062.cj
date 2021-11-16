// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ConcurrentModificationException


func main(): Int64 {
    var l : Int64 = 10
    func x(input:Int64):Int64{input}
    let a : ArrayList<Int64> = ArrayList<Int64>(l,x)
    func test(input:Int64){
        a.clear()
        return
    }
    a.forEach(test)
    return a.size()
}
