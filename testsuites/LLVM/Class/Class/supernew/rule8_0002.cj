// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test{
    Test(){ 
        Test() //EXPECTED: regex recursive constructor calling in class 'Test'
    }
}

class Test1{
    init(){ 
        Test1() //EXPECTED: regex recursive constructor calling in class 'Test1'
    }
}


class Test2{
    Test2(){ 
        this() //EXPECTED: regex recursive constructor calling in class 'Test2'
    }
}

class Test3{
    init(){ 
        this() //EXPECTED: regex recursive constructor calling in class 'Test3'
    }
}

func main(): Int64 {
    var test: Test = Test()
    var res1: Int32 = test.i
    print(res1.toString())
    return Int64(res1 - 2)
}
