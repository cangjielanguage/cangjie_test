// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f


class Base {
    func f() : Int32 {
        return 1
    }
    static func get() : Int32 {
        var a = f // EXPECTED: regex 'f' is non-static member, cannot be accessed by static function 'get'
        return 0
    }
}

abstract class Base1 {
    func f() : Int32 {
        return 1
    }
    static func get() : Int32 {
        var a = f // EXPECTED: regex 'f' is non-static member, cannot be accessed by static function 'get'
        return 0
    }
}

external class Base2 {
    func f() : Int32 {
        return 1
    }
    static func get() : Int32 {
        var a = f // EXPECTED: regex 'f' is non-static member, cannot be accessed by static function 'get'
        return 0
    }
}

internal class Base3 {
    func f() : Int32 {
        return 1
    }
    static func get() : Int32 {
        var a = f // EXPECTED: regex 'f' is non-static member, cannot be accessed by static function 'get'
        return 0
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
