// ERRCHECK: %compiler %cmp_opt %f -o %output

open class Father{}

class Child <: Father{}

func main(): Int64 {
    var l : Int64 = 10
    func x(input:Int64):Father{Father()}
    func y(input:Int64):Child{Child()}
    var a : ArrayList<Father> = ArrayList<Father>(l,x)
    var b : ArrayList<Child> = ArrayList<Child>(l,y)

    a.addAll(0,b) // EXPECTED: regex no matching function declaration for function call 'addAll'

    return 0
}