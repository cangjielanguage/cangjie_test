// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface Parent {
    func foo(): Int32{ return 2
    }
}

class Child <: Parent {
    func foo(): Int32{ return 1}
}

func main(): Int64 {
    var child : Child = Child()
    if (child.foo() != 1) {
        return 1
    }
    return 0
}
