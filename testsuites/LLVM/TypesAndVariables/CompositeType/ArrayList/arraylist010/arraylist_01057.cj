// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Father{
    var a : Bool = true
}

func main(): Int64 {
    var l : Int64 = 10
    func x(input:Int64):Father{Father()}
    var a : ArrayList<Father> = ArrayList<Father>(l,x)
    func test(input:Father):Bool{
        return input.a
    }
    a.removeIf(test)
    return a.size()
}