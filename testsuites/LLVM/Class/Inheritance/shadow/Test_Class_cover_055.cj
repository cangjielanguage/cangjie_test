// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex non-static member 'f' cannot have the same name with non-static member in parent class or interfaces

interface I1 {
    func f():Int32{
        return 1
    }
}

class C2 <: I1 {

    var f: Int32 = 2
}

func main(): Int64 {

    return 0
}
