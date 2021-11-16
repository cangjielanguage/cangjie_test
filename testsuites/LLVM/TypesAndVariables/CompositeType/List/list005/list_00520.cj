// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Father{}

class Child <: Father{}

func test(): Int64 {
    var l : List<Father> = [Child()]
    var i : Array<Father> = l.toArray()
    var a = List<Father>(i)
    return a.size() - 1
}

func main(): Int64 {
    return test()
}
