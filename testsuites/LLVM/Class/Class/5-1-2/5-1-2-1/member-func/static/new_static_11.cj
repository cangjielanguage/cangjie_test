// EXEC: %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args 


class Base {
    func f() : Int32 {
        return 1
    }
    func get() : Int32 {
        var a = f
        return a()
    }
}

abstract class Base1 {
    func f() : Int32 {
        return 1
    }
    func get() : Int32 {
        var a = f
        return a()
    }
}

external class Base2 {
    func f() : Int32 {
        return 1
    }
    func get() : Int32 {
        var a = f
        return a()
    }
}

internal class Base3 {
    func f() : Int32 {
        return 1
    }
    func get() : Int32 {
        var a = f
        return a()
    }
}

func main(): Int64 {
    return Int64(Base().get() + Base2().get() + Base3().get() - 3)
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
