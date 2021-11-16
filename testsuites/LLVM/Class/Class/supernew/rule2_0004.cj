// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base {
    init(){}
    init(i: Test2){}
}

class Test <: Base{
    var a: Int32 = 3
    init(i: Base){}

    init(i: Int32){
        this(super()) // EXPECTED: regex call to 'this' must be first expression in constructor of class 'Test2'

    }
}


class Test2 <: Base{
    var a: Int32 = 3
    init(){}

    init(i: Int32){
        super(this()) // EXPECTED: regex call to 'this' must be first expression in constructor of class 'Test2'
    }
}


func main(): Int64 {
    return 0
}
