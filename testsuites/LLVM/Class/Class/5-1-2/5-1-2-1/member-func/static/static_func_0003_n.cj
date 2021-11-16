// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

class Base {
    static func f() : Int32 {
        return 1
    }
    static func get() : Int32 {
        return this.f() // EXPECTED: regex non-static variable 'this' cannot be referenced from a static context
    }
}

