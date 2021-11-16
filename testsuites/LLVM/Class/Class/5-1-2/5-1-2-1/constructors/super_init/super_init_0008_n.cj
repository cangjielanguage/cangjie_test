// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f


open class Base {
    var a : Int32 = 100
    var b : Float32  = 10.0
}

class Data <: Base {
    var c : Int32 = 1
    init(value : Int32) { // Expected: regex recursive constructor calling detected
        this(value)
    }
    init() {
        this(3)
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
