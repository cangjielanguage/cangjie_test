// EXEC:%compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

open class C1 {
    static let x: Int32 = 1
}

class C2 <: C1 {
    static let x: Int32 = 2  // EXPECTED: regex the variable 'x' must not shadow a member variable of the supertype
}

func main(): Int64 {

    let v_x = C2.x
    var v_c1_x = C1.x

    if (v_c1_x != 1 || v_x != 2) {
        return 1
    }

    return 0
}
