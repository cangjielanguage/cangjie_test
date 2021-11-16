// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class ClassData {
    static let i: Int32 = 2
}

type CD = ClassData

class C <: CD {
    var j: Int32 = ClassData.i
    func get(): Int32 {
        return j
    }
}

func main(): Int64 {
    var test: C = C()
    if (test.get() == 2) {
        return 0
    }
    return 1
}