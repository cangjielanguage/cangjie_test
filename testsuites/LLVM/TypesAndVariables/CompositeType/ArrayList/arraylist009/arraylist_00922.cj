// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class Father{}

class Child <: Father{}

func main(): Int64 {
    var a : Int64 = 10
    func x(input:Int64):Father{Father()}
    var b : ArrayList<Father> = ArrayList<Father>(a,x)

    b.add(Child())

    return b.size()-11
}