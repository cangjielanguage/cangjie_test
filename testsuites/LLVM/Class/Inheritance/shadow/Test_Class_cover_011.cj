// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex The return type of the override/redefine/implement function must be the same as or a subtype of the overridden/redefined/implemented function

open class C1 {
    let x1 = 1
    open func f_c1() {
        return x1
    }
}

class C2 <: C1 {
    let x2 = "subclass"
    func f_c1() {
        return x2
    }
}

func main(): Int64 {

    return 0
}