// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class C1 {
    static var x1 = 1
    static func f1() {
        return x1
    }
}

class C2 <: C1 {
    static let x2 = 2
    redef static func f1() {
        return x2
    }
}

func main(): Int64 {

    var v1 = C1.f1()

    var v2 = C2.f1()

    if (v1 != 1 || v2 != 2) {
        return 1
    }

    return 0
}
