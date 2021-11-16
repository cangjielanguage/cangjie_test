// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
open class Base<T>{
    
}

class Test <T> <: Base <T>{
    var a: Int32 = 3
    init(){}

    Test(i: Int32){
        this.a = 9
        super() // EXPECTED: regex call to 'super' must be first expression in constructor of class 'Test'

    }
}


class Test2 <T> {
    var a: Int32 = 3
    init(){}

    Test2(i: Int32){
        this.a = 9
        this() // EXPECTED: regex invalid calling 'this' in primary constructor
    }
}


func main(): Int64 {
    return Int64( Test<Int32>().a )
}
