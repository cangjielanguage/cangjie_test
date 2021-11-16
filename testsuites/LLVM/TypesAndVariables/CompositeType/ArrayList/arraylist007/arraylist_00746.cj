// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Father{}

class Child <: Father{}

func main(): Int64 {
    //var a : Array<Child> = [Child()].toArray()
    var a : Array<Child> = @{Child()}
    var b : ArrayList<Father> = ArrayList<Father>(@{Child()})
    return b.size() - 1
}
