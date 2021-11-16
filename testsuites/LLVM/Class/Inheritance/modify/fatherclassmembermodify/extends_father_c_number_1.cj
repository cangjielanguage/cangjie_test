// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Parent {
    var a : Int32
    init()  {
       a = 1
    }
}

class Child <: Parent {}

func main(): Int64 {
    var child : Child = Child()
    if (child.a != 1) {
        return 1
    }
    return 0
}
