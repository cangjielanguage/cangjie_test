// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface I1 {
    static func f():Int32{
        return 1
    }
}

class C2 <: I1 {

    static let x2 = "class"
    static func f() { // EXPECTED: regex The return type of the override/redefine/implement function must be the same as or a subtype of the overridden/redefined/implemented function
        return x2
    }
}

func main(): Int64 {

    var r = C2.f()

    if (r != "class" || I1.f() != 1) {
        return 1
    }

    return 0
}
