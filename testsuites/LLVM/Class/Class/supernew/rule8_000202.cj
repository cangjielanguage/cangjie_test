// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Test<T, U>{
    Test(){ 
        Test<T, U>() //EXPECTED: regex recursive constructor calling in class 'Test'
    }
}

class Test1<T, U>{
    init(){ 
        Test1<T, U>() //EXPECTED: regex recursive constructor calling in class 'Test1'
    }
}


class Test2<T, U>{
    Test2(){ 
        this() //EXPECTED: regex recursive constructor calling in class 'Test2'
    }
}

class Test3<T, U>{
    init(){ 
        this() //EXPECTED: regex recursive constructor calling in class 'Test3'
    }
}

func main(): Int64 {
    return 0
}
