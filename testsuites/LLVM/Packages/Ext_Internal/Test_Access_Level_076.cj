// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

external interface I1 {
    func f() { return 1}
}

external interface I2 <: I1 {
    func f() {return 2}
}

external open class C1 <: I2 {
    public func f() { return 3 }
}

func main(): Int64 {

    var obj:C1 = C1()
    if (obj.f() != 3) {
        return 1
    }

    return 0
}
