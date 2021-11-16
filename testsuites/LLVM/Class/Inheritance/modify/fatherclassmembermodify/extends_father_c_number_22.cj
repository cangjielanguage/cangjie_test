// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

open class Parent {
    static protected func foo(): Int32 {
        return 1
    }
}

class Child <: Parent {}

func main(): Int64 {
    if (Child.foo() != 1) {  // EXPECTED: regex no matching function declaration for function call
        return 1
    }
    return 0
}
