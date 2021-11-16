// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var l : Int64 = 10
    let a : ArrayList<Int64> = ArrayList<Int64>(l)
    func test(input:Int64):Bool{
        return true
    }
    a.removeIf(test)
    return a.size()
}