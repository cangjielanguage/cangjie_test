// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface R{}
class X <: R{}

func main(): Int64 {
    //var a : Array<R> = [X()].toArray()
    var a : Array<R> = @{X()}
    var b : ArrayList<R> = ArrayList<R>(a)
    return b.size() - 1
}