// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

internal interface I1 {
    static func a() { return 1}
}

external interface I2 <: I1 {
    static func a() { return 2}
}

func main(): Int64 {

    if (I2.a() != 2 || I1.a() != 1) { // EXPECTED: regex function 'a' cannot be accessed by interface name 'I2'
        return 1
    }

    return 0
}