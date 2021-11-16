// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex static member 'a' cannot have the same name with non-static member in parent class or interfaces

internal interface I1 {
    func a() { return 1}
}

external interface I2 <: I1 {
    static func a() { return 2}
}

func main(): Int64 {

    return 0
}