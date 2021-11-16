// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{}

func main(): Int64 {
    //var a : Array<Object> = [A()].toArray()
    var a : Array<Object> = @{A()}
    var b : ArrayList<Object> = ArrayList<Object>(a)
    return b.size() - 1
}