// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test{
    var a: Int32 = 3

    Test(i!: Int32 = {
        this() // EXPECTED: regex invalid calling 'this' in primary constructor
        1}
    ){ 

    }
}


class Test2{
    var a: Int32 = 3

    Test2(i!: Int32 = {

        super()  // EXPECTED: regex call to 'super' must be first expression in constructor of class 'Test2'
        1}
    ){ 

    }
}

func main(): Int64 {
    return Int64( Test().a )
}
