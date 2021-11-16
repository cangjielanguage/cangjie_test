// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var l : Int64 = 10
    func x(input:Int64):Int64{input}
    let a : ArrayList<Int64> = ArrayList<Int64>(l,x)
    let b : ArrayList<Int64> = ArrayList<Int64>(l)
    func test(input:Int64):Bool{
        a.addAll(0,b)
        return true
    }
    a.removeIf(test)
    return a.size()
}