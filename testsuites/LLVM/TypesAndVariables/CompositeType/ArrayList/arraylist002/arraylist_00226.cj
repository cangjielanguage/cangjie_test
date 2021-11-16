// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
enum A{a(Int64)}
func main(): Int64 {
    func x(a:Int64):A{A.a(1)}
    var i : Int64 = 10
    var myArray : ArrayList<A> = ArrayList<A>(i,x)
    return 0
}