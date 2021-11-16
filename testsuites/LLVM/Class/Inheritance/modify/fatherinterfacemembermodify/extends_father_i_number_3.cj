// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface Parent {
    static func foo(): Int32{2}
}

class Child <: Parent {
    func foo(): Int32{ return 1} // EXPECTED: regex member 'foo' cannot have the same name with static member in parent class or interfaces
}

func main(): Int64 {
    if (Child().foo() != 1) {
        return 1
    }
    return 0
}
