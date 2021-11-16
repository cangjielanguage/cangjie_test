// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

open class Parent {
    public func foo() : Int32{
        return 1
    }
}

class Child <: Parent {}

func main(): Int64 {
    var child : Child = Child()
    if (child.foo() != 1) {
        return 1
    }
    return 0
}
