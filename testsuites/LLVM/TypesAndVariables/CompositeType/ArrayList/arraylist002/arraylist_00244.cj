// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{}

func main(): Int64 {
    func x(a:Int64):Object{A()}
    var i : Int64 = 10
    var myArray : ArrayList<Object> = ArrayList<Object>(i,x)
    return 0
}