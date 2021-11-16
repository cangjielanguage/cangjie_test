// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex recursive constructor calling detected


open class Base {
    var a : Int32 = 100
    var b : Float32  = 10.0
}

class Data <: Base {
    var c : Int32
    var d : Int32
    init(value : Int32) {
        this(value)
        c = 1
    }

    init() {
        this(3)
    }
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
