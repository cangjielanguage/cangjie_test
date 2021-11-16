// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    func x(input:Int64){return ()}
    var a : ArrayList<Unit> = ArrayList<Unit>(10,x)
    return a.size() - 10
}