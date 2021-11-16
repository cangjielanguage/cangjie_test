// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface I1 {
    static func f():Int32{
        return 1
    }
}

class C2 <: I1 {

    static var f: Int32 = 2 //EXPECTED: regex static member 'f' cannot have the same name with static member in parent class or interfaces
}

func main(): Int64 {

    var r = C2.f

    if (r != 2 || I1.f() != 1) {
        return 1
    }

    return 0
}
