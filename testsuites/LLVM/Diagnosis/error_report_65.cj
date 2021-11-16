// EXEC-PIPE-1:%compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


enum Unit2 {
      u2_10(Int64)
    | u2_110(Int64, Int64)
    | u2_1110(Int64, Int64, Int64)
    | u2_1110(Int64, Int32, Int64, Int32)
}
func main(): Int64 {
    var u2 = Unit2.u2_1110(10, 100, 1000)
    match (u2) {
        case u2_10(a) | u2_1110(_, a, _, _) => 0 // EXPECTED: regex different type of variables are introduced in enum pattern
        case _ => 0
    }
    return 0
}

