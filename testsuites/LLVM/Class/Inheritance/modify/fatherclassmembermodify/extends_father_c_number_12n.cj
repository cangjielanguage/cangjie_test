// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

open class Parent {
    private func foo() : Int32 {
        return 1
    }
}

class Child <: Parent {}

func main(): Int64 {
    var child : Child = Child()
    if (child.foo() != 1) { // EXPECTED: regex no matching function declaration for function call
        return 1
    }
    return 0
}
