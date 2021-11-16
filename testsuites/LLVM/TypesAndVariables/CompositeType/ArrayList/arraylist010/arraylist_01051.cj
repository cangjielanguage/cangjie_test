// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var l : Int64 = 10
    func x(input:Int64):Int64{input}
    var a : ArrayList<Int64> = ArrayList<Int64>(l,x)
    func test(input:Int64):Bool{
        return false
    }
    var s_1 = a.size()
    a.removeIf(test)
    return a.size() - s_1
}