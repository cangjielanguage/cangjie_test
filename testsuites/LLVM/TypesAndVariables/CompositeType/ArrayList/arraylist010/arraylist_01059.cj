// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var l : Int64 = 10
    func x(input:Int64):Int64{1}
    var a : ArrayList<Int64> = ArrayList<Int64>(l,x)
    func test(input:Int64):Bool{
        if (input == 1) {
            return true
        }
        return false
    }
    a.removeIf(test)
    return a.size()
}