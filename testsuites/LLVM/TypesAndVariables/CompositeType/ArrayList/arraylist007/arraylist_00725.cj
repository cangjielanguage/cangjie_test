// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface R<T>{}
class X <: R<Int64>{}


func main(): Int64 {
    //var a : Array<R<Int64>> = [X()].toArray()
    var a : Array<R<Int64>> = @{X()}
    var b : ArrayList<R<Int64>> = ArrayList<R<Int64>>(a)
    return b.size() - 1
}