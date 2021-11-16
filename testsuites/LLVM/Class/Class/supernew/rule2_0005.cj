// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test{
    var a: Int32 = 3
    init(){}

    init(i: Int32){
        this.a = 9
        super() // EXPECTED: regex call to 'super' must be first expression in constructor of class 'Test'

    }
}


class Test2{
    var a: Int32 = 3
    init(){}

    init(i: Int32){
        this.a = 9
        this() // EXPECTED: regex call to 'this' must be first expression in constructor of class 'Test2'
    }
}


func main(): Int64 {
    return Int64( Test().a )
}
