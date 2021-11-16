// EXEC: %compiler %cmp_opt  -c %f 2>&1 | compare %f

open class Base {
    static func getA() : Int32 {
        return 1
    }
}

class Data <: Base {
    static func getB() : Int32 {
        return super.getA() // EXPECTED: regex non-static variable 'super' cannot be referenced from a static context
    }
}
