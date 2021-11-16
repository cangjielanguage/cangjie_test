// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class C1 {
    static let f1 = "new"
}

class C2 <: C1 {
    static var x1 = 1
    static func f1() { // EXPECTED: regex-auto static member 'f1' cannot have the same name with static member in parent class or interfaces
        return x1
    }
}

func main(): Int64 {

    var v1 = C2.f1()

    var v2 = C1.f1

    if (v1 != 1 || v2 != "new") {
        return 1
    }

    return 0
}
