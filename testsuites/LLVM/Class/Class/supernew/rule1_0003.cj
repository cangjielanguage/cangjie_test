// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base{

    func b() : Int32{
	    9
    }

}

class Test <: Base{
    var a: Int32 = 3

    Test(var i!: ()->Int32 = super.b){ //EXPECTED: regex 'super' is not allowed to be used in default parameter value of the constructor
    }
}

func main(): Int64 {
    var test: Test = Test()
    var res1: Int32 = test.a
    print(res1.toString())
    return Int64(res1 - 2)
}
