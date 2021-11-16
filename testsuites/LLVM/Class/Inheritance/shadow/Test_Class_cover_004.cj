// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

open class C1 {
    static func x():Int64 {
        return 1
    }

}

class C2 <: C1 {
    let x = 2 // EXPECTED: regex non-static member 'x' cannot have the same name with static member in parent class or interfaces
}

func main(): Int64 {

    var obj: C2 = C2()
    let r = obj.x

    if (r != 2 || C1.x() != 1) {
        return 1
    }

    return 0
}
