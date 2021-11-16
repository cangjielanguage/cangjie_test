// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    let a : ArrayList<Unit> = ArrayList<Unit>(10)
    func x(input:Int64){a}
    var b : ArrayList<ArrayList<Unit>> = ArrayList<ArrayList<Unit>>(10,x)
    return 0
}