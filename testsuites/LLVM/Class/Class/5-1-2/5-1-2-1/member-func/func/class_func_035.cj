// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args


open class Base {
    static func get() : Int32 {
        return  1
    }
}

class Data <: Base {
    func f() : Int32 {
        return Base.get()
    }
}

func main(): Int64 {
    var value : Data = Data()
    if (value.f() != 1) {
        return 1
    }
    return 0
}

