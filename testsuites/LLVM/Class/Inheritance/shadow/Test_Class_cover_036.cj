// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

internal interface I1 {
    static func a() { return 1}
}

external interface I2 <: I1 {
    func a() { return 2} // EXPECTED: regex non-static member 'a' cannot have the same name with static member in parent class or interfaces
}

external open class C1 <: I2 {

}

func main(): Int64 {

    var v : C1 = C1()

    if (v.a() != 2 || I1.a() != 1) {  // EXPECTED: regex function 'a' cannot be accessed by interface name 'I1'
        return 1
    }

    return 0
}
