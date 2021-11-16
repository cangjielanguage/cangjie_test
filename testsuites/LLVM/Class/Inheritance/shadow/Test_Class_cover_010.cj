// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class C1 {
    static var f_c1 = 2
}

class C2 <: C1 {
    let x = 1
    func f_c1() { // EXPECTED: regex-auto non-static member 'f_c1' cannot have the same name with static member in parent class or interfaces
        return x
    }
}

func main(): Int64 {

    var a = C1.f_c1
    var obj : C2 = C2()

    if (a != 2 || obj.f_c1() != 1) {
        return 1
    }

    return 0
}