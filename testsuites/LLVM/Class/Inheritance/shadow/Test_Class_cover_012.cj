// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

open class C1 {
    static let x2 = "subclass"
    static func f_c1() {
        return x2
    }
}

class C2 <: C1 {
    let x = 1
    open func f_c1() { // EXPECTED: regex error.*?non-static member 'f_c1' cannot have the same name with static member in parent class or interfaces
        return x
    }
}

func main(): Int64 {

    var obj: C2 = C2()

    if (C1.f_c1() != "subclass" || obj.f_c1() != 1) {
        return 1
    }

    return 0
}
