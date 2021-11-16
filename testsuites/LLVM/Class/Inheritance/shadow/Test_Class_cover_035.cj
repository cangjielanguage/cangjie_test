// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex The return type of the override/redefine/implement function must be the same as or a subtype of the overridden/redefined/implemented function

internal interface I1 {
    func a() { return "null"}
}

external interface I2 <: I1 {
    func a() { return 2}
}


func main(): Int64 {

    return 0
}