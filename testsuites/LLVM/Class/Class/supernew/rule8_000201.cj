// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

abstract class Test{
    Test(){ 
        Test() //EXPECTED: regex abstract class 'Test' can not be instantiated

    }
}

abstract class Test1{
    init(){ 
        Test1() //EXPECTED: regex abstract class 'Test1' can not be instantiated
    }
}


abstract class Test2{
    Test2(){ 
        this() //EXPECTED: regex recursive constructor calling in class 'Test2'
    }
}

abstract class Test3{
    init(){ 
        this() //EXPECTED: regex recursive constructor calling in class 'Test3'
    }
}

func main(): Int64 {
    return 0;
}
