// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump


open class C1 {
    let x = 1
}

class C2 <: C1 <T>   let x = "new"

    var super_acc_father : int64

    let v_c1 = C1()
    var object_acc_father = v_c1.x
    init() {
    super_acc_father = super.x
    }
}

func main(): int64 {

    let obj = C2()
    let r = obj.x

    var father1 = obj.super_acc_father
    let father2 = obj.object_acc_father


    if r != "new" || father1 != 1 || father2 != 1 {
    return 1
    }

    return 0
}
