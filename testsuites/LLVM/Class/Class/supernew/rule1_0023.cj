// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base{
    var b : Int32 = 9
}

class Test <T, U> <: Base{
    var a: Int32 = 3
    Test(var i!: Int32 = super.b){ //EXPECTED: regex 'super' is not allowed to be used in default parameter value of the constructor
    
    }
}

func main(): Int64 {
    return 1
}
