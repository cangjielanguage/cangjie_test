// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
interface A{}
class X <: A{}
func main(): Int64 {
    func x(a:Int64):A{X()}
    var i : Int64 = 10
    var myArray : ArrayList<A> = ArrayList<A>(i,x)
    return 0
}