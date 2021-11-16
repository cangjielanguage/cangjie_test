// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    func x(a:Int64):Char{'a'}
    var i : Int64 = 10
    var myArray : ArrayList<Char> = ArrayList<Char>(i,x)
    return 0
}