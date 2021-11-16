// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A<T>{}
func main(): Int64 {
    func x(a:Int64):A<Int64>{A<Int64>()}
    var i : Int64 = 10
    var myArray : ArrayList<A<Int64>> = ArrayList<A<Int64>>(i,x)
    return 0
}