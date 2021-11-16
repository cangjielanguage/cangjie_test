// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex The return type of the override/redefine/implement function must be the same as or a subtype of the overridden/redefined/implemented function

interface I1 {
    func f():Int32{
        return 1
    }
}

class C2 <: I1 {

    let x2 = "subclass"
    func f() {
        return x2
    }
}

func main(): Int64 {

    return 0
}
