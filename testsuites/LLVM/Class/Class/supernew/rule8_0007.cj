// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Base{
    init(){
    }	
}

class Test <: Base{
    Test(a!: Test = Test()){ //EXPECTED: regex recursive constructor calling in class 'Test'
    }
}

class Test1 <: Base{
    init(a!: Test1 = Test1()){ //EXPECTED: regex recursive constructor calling in class 'Test1'
    }
}

class Test2 <: Base{
    init(a!: Test2 = this()){ //EXPECTED: regex recursive constructor calling in class 'Test2'
    }
}

func main(): Int64 {
    var test: Test = Test()
    return 0
}
