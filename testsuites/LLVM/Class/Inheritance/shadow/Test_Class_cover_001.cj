// EXEC:%compiler %frontend %cmp_opt %typecheck %f 2>&1 | compare %f
// ASSERT: regex-not core dump

open class C1 {
    let x = 1
}

class C2 <: C1 {
    let x = "new"  // EXPECTED: regex the variable 'x' must not shadow a member variable of the supertype

    var super_acc_father : Int64

    let v_c1 = C1()
    var object_acc_father = v_c1.x
    init() {
        super_acc_father = super.x
    }
}

func main(): Int64 {

    let obj = C2()
    let r = obj.x

    var father1 = obj.super_acc_father
    let father2 = obj.object_acc_father


    if (r != "new" || father1 != 1 || father2 != 1) {
        return 1
    }

    return 0
}
