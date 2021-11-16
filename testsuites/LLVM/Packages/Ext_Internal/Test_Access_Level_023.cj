 // EXEC: %compiler %cmp_opt %f -o %output
 // EXEC: %run %run_opt %output %run_args

external interface I1 {
    func f() { return 1}
}


external open class C1 <: I1 {
    public func f() { return 2 }
}

internal open class C2 <: I1 {
    public func f() { return 3 }
}

func main(): Int64 {

    var obj1:C1 = C1()
    var obj2:C2 = C2()

    if (obj1.f() != 2 || obj2.f() != 3) {
        return 1
    }

    return 0
}
