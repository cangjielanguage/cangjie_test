// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    func x(input:Int64){return ()}
    var a : ArrayList<Unit> = ArrayList<Unit>(10,x)
    a.add(x(1))
    return a.size() - 11
}