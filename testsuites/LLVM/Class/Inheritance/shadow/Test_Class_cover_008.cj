// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


open class C1 {
    static func x():Int64 {
        return 2
    }
}

class C2 <: C1 {
    static let x = 1 // EXPECTED: regex static member 'x' cannot have the same name with static member in parent class or interfaces
}

func main(): Int64 {

    let v_x = C1.x()
    var v_c1_x = C2.x

    if (v_c1_x != 1 || v_x != 2) {
        return 1
    }

    return 0
}
