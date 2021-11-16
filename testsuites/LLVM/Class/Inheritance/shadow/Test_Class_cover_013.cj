// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex static member 'f1' cannot have the same name with non-static member in parent class or interfaces

open class C1 {
    let f1 = "new"
}

class C2 <: C1 {

    static var x1 = 1
    static func f1() {
        return x1
    }
}

func main(): Int64 {

    return 0
}
