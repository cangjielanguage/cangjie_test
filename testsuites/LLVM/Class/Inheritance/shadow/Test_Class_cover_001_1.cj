// EXEC:%compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

open class C1 {
    let x = 1
}

class C2 <: C1 {
    let x = 2  // EXPECTED: regex the variable 'x' must not shadow a member variable of the supertype
}

func main(): Int64 {

    let obj: C1 = C2()
    let r = obj.x

    if (r != 1) {
        return 1
    }

    return 0
}
