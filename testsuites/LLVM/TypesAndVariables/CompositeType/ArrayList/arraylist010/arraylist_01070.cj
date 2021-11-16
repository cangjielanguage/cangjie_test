// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var l : Int64 = 10
    func x(input:Int64):Int64{input}
    let a : ArrayList<Int64> = ArrayList<Int64>(l,x)
    func test(input:Int64){
        a.size()
        return
    }
    a.forEach(test)
    return a.size() - 10
}