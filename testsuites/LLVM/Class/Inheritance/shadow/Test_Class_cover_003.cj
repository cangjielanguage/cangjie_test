// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex non-static member 'x' cannot have the same name with non-static member in parent class or interfaces

open class C1 {
    private var a = 1
    func x():Int64 {
        return a
    }
}

class C2 <: C1 {
    let x = 2
}

func main(): Int64 {

    return 0
}
