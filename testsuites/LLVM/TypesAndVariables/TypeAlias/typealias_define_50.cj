// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class ClassData {
    static let a: Int32 = -2
    private var i: Int32 = 333

    static func get_a(): Int32 {
        return a
    }

    func set(j: Int32) {
        i = j
    }

    func get(): Int32 {
        return i
    }
}

type CD<T> = ClassData

func main(): Int64 {
    var cd1: CD<Int32> = ClassData()
    var res1: Int32 = cd1.get()
    cd1.set(-333)
    var res2: Int32 = cd1.get()
    var res3: Int32 = CD<Int32>.get_a()
    if (res1 == 333 && res2 == -333 && res3 == -2) {
        return 0
    }
    return 1
}