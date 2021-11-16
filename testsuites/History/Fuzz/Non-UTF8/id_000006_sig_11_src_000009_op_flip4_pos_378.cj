// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex non-static member 'f_c1' cannot have the same name with non-static member in parent class or interfaces

open class C1 {
    var f_c1 = 1
}

class C2 <: C1 {
    let x = 2
    func f_c1() {
        return x
    }
}

func main(): int64 {

    var obj: C1 = C1()
    if obj.f_c1 != 1 {
        return 1
    }

    return 0
}