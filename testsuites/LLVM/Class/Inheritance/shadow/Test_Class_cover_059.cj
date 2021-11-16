// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface I1 {
    static func f():Int32{
        return 1
    }
}

class C2 <: I1 {

    var f: Int32 = 2 //EXPECTED:regex non-static member 'f' cannot have the same name with static member in parent class or interfaces
}

func main(): Int64 {

    var obj: C2 = C2()
    var r = obj.f

    if (r != 2 || I1.f() != 1) {
        return 1
    }

    return 0
}
