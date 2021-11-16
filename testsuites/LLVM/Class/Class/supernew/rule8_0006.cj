// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base{
    init(){
    }	
}

class Test <: Base{
    // only one error message, same as java
    init(){ //EXPECTED: regex recursive constructor calling detected
        this(true)
    }

    init(a: Bool){
        this(true, true)
    }

    init(a: Bool, b: Bool){
        this(true, true, true)
    }

    init(a: Bool, b: Bool, c: Bool){
        this(true, true, true, true)
    }

    init(a: Bool, b: Bool, c: Bool, d: Bool){
        this(true, true, true, true, true)
    }

    init(a: Bool, b: Bool, c: Bool, d: Bool, e: Bool){
        this(true, true, true, true, true, true)
    }

    init(a: Bool, b: Bool, c: Bool, d: Bool, e: Bool, f:Bool){
        this()
    }
}

func main(): Int64 {
    var test: Test = Test()
    return 0
}
