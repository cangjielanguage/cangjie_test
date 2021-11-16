// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Father{}

class Child <: Father{}

func main(): Int64 {
    func x(a:Int64):Child{Child()}
    var i : Int64 = 5
    var a = ArrayList<Father>(i,x)
    return 0
}